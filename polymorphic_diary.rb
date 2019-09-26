class ScrambledDiary
    def initialize(contents)
        @contents = contents
    end
  
    def read
        @contents
    end

    def scramble(steps=0, scramble_type)
        @contents = scramble_type.scramble(steps, @contents)
    end

    def unscramble(steps=0)
        @contents = scramble_type.unscramble(steps, @contents)
    end
end


class ReversingChars
    def self.scramble(_steps, string)
        string.reverse
    end

    def self.unscramble(_steps, string)
        string.reverse
    end
end

class AdvancingChars
    ERROR_MESSAGE = 'Tried to scramble by advancing characters 0 steps.'

    def self.scramble(steps, string)
        raise ERROR_MESSAGE unless valid_steps_no?(steps)
        
        plain_chars = string.chars
        scrambled_chars = plain_chars.map do |char|
          (char.ord + steps).chr
        end
        scrambled_chars.join
    end

    def self.unscramble(steps, string)
        raise ERROR_MESSAGE unless valid_steps_no?(steps)
        
        scrambled_chars = string.chars
        plain_chars = scrambled_chars.map do |char|
          (char.ord - steps).chr
        end
        plain_chars.join
    end

    private_class_method :valid_steps_no?

    def self.valid_steps_no?(steps)
        steps.positive?
    end
end
