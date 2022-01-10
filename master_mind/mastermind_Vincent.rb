class Game
  attr_accessor :board

  def init
  def play
  def take_guess

end


class Board
  attr_accessor :guesses, :code, :attempt

  def initialize
    @guesses  = 0
    @code     = generate_code
    @attempt  = nil
  end

  def generate_code
    (0..3).map{ rand(1..6) }
  end

  def guess
    return 'error' unless valid_attempt?
    return 'win' if win?

    @guesses += 1
    return 'end' if end?

    generate_clue
  end

  def valid_attempt?
    @attempt.length == 4  && @attempt.reject{ |value| value <= 6  || value >= 1 }.any?
  end

  def win?
    @attempt == @code
  end

  def end?
    win? || guesses >= 12
  end

  def generate_clue
    clue = []
    code = @code

    @attempt.each_with_index do |value, index|
      if value == code[index]
        clue        += 'b'
        code[index] = nil
      end
    end

    @attempt.each do |value|
      if code.include?(value)
        clue                    += 'w'
        code[code.index(value)] = nil
      end
    end

    clue
  end

  def display_code
    puts @code.join(', ')
  end

end
