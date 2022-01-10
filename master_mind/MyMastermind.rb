class Game
  attr_accessor :code
  
  def initialize(code)
    @code        = generate_code
    @guess_count = 0
  end
       
  def generate_code
    (0..3).map{ rand(1..6) }
  end
       
  def guess(guess_code)
    @guess = guess_code
    return "Fault input" unless @guess.length == 4 && @guess.reject { |value| value <= 6 || value >= 1 }.any?
    @guess_count += 1
    print "Your guess => #{@guess}"
    if win?
      return "Player wins"
    elsif end?
      return "Better luck next time"
    else
      return clues
    end
  end
       
  def win?
    @guess == @code
  end
       
  def end?
    win? || @guess_count <= 12
  end
       
  def clues
    clue = []
    code = @code.dup
    @guess.each do |value|
      if code.include?(value)
        clue       += "X"
        code[code.index(value)] = nil
      end
    end
       
    @guess.each_with_index do |value, index|
      if value     == code[index]
        clue       += "0"
        code[index] = nil
      end
    end
  end
end

game = Game.new()
puts "Choose any four digit combination between 1 and 6"
puts "X indicates that a number is correct but is in wrong position"
puts "0 indicates that a number is correct and in correct position"
puts "You have 12 attempts"

until game.win? || game.end? do
  puts "Take a guess"
  input = gets.chomp()
  result = game.guess(input)
  puts result
end