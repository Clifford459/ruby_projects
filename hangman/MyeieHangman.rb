class Game
  attr_accessor :letters, :word_progress, :guesses

  def initialize
    @word           = random_word
    @letters        = ("a".."z").to_a
    @guess_count    = 0
    @guesses        = []
    @word_progress  = @word.gsub(/[a-z]/,'_').strip
  end

  def random_word
    wordlist = IO.readlines("/home/clifford/Ruby_projects/Hangman/wordlist.txt") #location of file, wordlist
    wordlist.sample.strip { |word| word.length.between?(5, 12) }
  end  

  def word_solved?
    @word == @word_progress
  end

  def game_end?
    word_solved? || @guess_count >= 8
  end

  def guess(guess)
    return 'Invalid guess' unless guess_valid?(guess)

    process_guess(guess)

    if word_solved?
      return "You win!"
    elsif game_end?
      return "You are hanged"
    else
      return "Next guess"
    end
  end

  def guess_valid?(guess)
    @letters.include?(guess)
  end

  def process_guess(guess)
    @guess_count += 1
    @guesses << guess
    @letters.delete_at(@letters.index(guess))

    @word.split('').each_with_index do |character, index|
      if character == guess
        @word_progress[index] = guess
      end
    end
  end
end


game = Game.new()
puts "Guess a letter that you think is part of the word"
puts "If you are correct the letter will be placed in the correct position/positions, if it repeats"
puts "You will be hanged on the 8th wrong guess"

until game.word_solved? || game.game_end? do
  puts "Your current progress: #{game.word_progress}"
  puts "Your current guesses: #{game.guesses}"
  puts "Guess any valid letter"
  puts "Valid options are #{game.letters}"
  input = gets.chomp()
  result = game.guess(input.downcase)
  puts result
end





  
