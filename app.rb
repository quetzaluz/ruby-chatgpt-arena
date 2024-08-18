#!/usr/bin/env ruby

require 'highline'
require 'openai'
require_relative 'character'
require_relative 'prompts'

cli = HighLine.new
OpenAI.configure do |config|
    config.access_token = ENV.fetch("GPT_API_KEY")
end
client = OpenAI::Client.new

puts INTRODUCTION

def generate_character(type, cli, client)
    name = cli.ask(Q_NAME % [type])
    character = Character.new(name)
    puts character.statistics(type)
    description = cli.ask(Q_DESCRIPTION % [type, type])

    response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{
                role: "user",
                content: "Expand this short description into a three to five sentence description: #{description}"
            }],
            temperature: 0.7,
        })
    
    character.set_description(response['choices'][0]['message']['content'])

    response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{
                role: "user",
                content: "Return a JSON object with three fields, strength, constitution, and speed. Allocate 20 points among all three fields, with a maximum of 10 points in any one field, based off of this description: #{character.description}"
            }],
            temperature: 0.7,
        })
    stats = JSON.parse(response['choices'][0]['message']['content'])
    character.set_strength(stats['strength'])
    character.set_constitution(stats['constitution'])
    character.set_speed(stats['speed'])

    puts character.statistics(type)
    return character
end

def begin_fight(fighter, opponent, client)
    response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{
                role: "user",
                content: """
                    In five to eight sentences, describe an epic fight between a fighter and an opponent; the last sentence should clearly state who the winner is.

                    Details about the fighter:
                    #{fighter.statistics('fighter')}

                    Details about the opponent:
                    #{opponent.statistics('opponent')}
                """
            }],
            temperature: 0.7,
        })
    puts response['choices'][0]['message']['content']
end

fighter = generate_character('fighter', cli, client)
opponent = generate_character('opponent', cli, client)

puts FIGHT_INTRODUCTION
begin_fight(fighter, opponent, client)