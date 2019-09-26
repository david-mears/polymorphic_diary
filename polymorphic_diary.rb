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
    def scramble(steps, string)
        if !valid_steps_no?(steps) raise 'Tried to scramble by advancing characters 0 steps.'
        
        plain_chars = string.chars
        scrambled_chars = plain_chars.map do |char|
          (char.ord + steps).chr
        end
        return scrambled_chars.join
    end

    def unscramble(steps, string)
        if !valid_steps_no?(steps) raise 'Tried to scramble by advancing characters 0 steps.'
        
        scrambled_chars = string.chars
        plain_chars = scrambled_chars.map do |char|
          (char.ord - steps).chr
        end
        return plain_chars.join
    end

    private

    def valid_steps_no?(steps)
        steps > 0
    end
end

class ReversingChars
    def scramble(steps, string)
        return string.reverse
    end

    def unscramble(steps, string)
        return string.reverse
    end
end