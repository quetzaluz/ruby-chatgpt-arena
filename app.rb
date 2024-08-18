#!/usr/bin/env ruby

require 'highline'
require_relative 'prompts'

cli = HighLine.new
puts INTRODUCTION
answer = cli.ask(Q_FIGHTER_NAME)

puts "You have answered: #{answer}"

