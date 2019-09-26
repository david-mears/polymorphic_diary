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

class AdvancingChars
    ERROR_MESSAGE = 'Tried to scramble by advancing characters 0 steps.'

    def self.scramble(steps, string)
        raise ERROR_MESSAGE unless valid_steps_no?(steps)
        
        plain_chars = string.chars
        scrambled_chars = plain_chars.map do |char|
          (char.ord + steps).chr
        end
        return scrambled_chars.join
    end

    def self.unscramble(steps, string)
        raise ERROR_MESSAGE unless valid_steps_no?(steps)
        
        scrambled_chars = string.chars
        plain_chars = scrambled_chars.map do |char|
          (char.ord - steps).chr
        end
        return plain_chars.join
    end

    private

    def self.valid_steps_no?(steps)
        steps > 0
    end
end

class ReversingChars
    def self.scramble(steps, string)
        return string.reverse
    end

    def self.unscramble(steps, string)
        return string.reverse
    end
end