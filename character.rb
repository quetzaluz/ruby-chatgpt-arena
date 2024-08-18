#!/usr/bin/env ruby

class Character
    def initialize(name)
        @name = name
        @description = nil
        @strength = nil
        @constitution = nil
        @speed = nil
     end

     def name
        @name
     end

     def description
        @description
     end

     def strength
        @strength
     end

     def constitution
        @constitution
     end

     def speed
        @speed
     end

     def set_description(description)
        @description = description
     end

     def set_strength(strength)
        @strength = strength
     end

     def set_constitution(constitution)
        @constitution = constitution
     end

     def set_speed(speed)
        @speed = speed
     end

    def statistics(type = 'character')
        capitalized_type = type.capitalize
        """
            #{capitalized_type} name: #{name}
            #{capitalized_type} description: #{description}
            #{capitalized_type} strength: #{strength}
            #{capitalized_type} speed: #{speed}
            #{capitalized_type} constitution: #{constitution}
        """
    end
end