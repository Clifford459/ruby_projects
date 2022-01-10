class Game
  attr_accessor :current_player, :board

  def initialize()
    @current_player = 1
    @board          = Board.new()
  end

  def play_move(move)
    if board.play_move(@current_player, move) == 'error'
      return 'error'
    else
      rotate_player
    end
  end

  def rotate_player
    @current_player = (@current_player == 1 ? 2 : 1)
  end

  def end?
    board.win? || board.draw?
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def display_board
    (0..2).each do |row|
      offset = row*3
      puts "#{board_value(@board[0+offset])} #{board_value(@board[1+offset])} #{board_value(@board[2+offset])}"
    end
  end

  def board_value(value)
    value.nil? ? '-' : value
  end

  def valid_move?(move)
    move.between?(1,9) && !@board[move - 1]
  end

  def player_from_token(token)
    {
      'X': 1,
      'O': 2
    }[token]
  end

  def token_from_player(player)
    player == 1 ? 'X' : 'O'
  end

  def win?
    (0..2).each do |count|
      win_row = test_row(count)
      win_column = test_column(count)

      return win_row if win_row != false
      return win_column if win_column != false
    end

    if test_set(@board[0], @board[4], @board[8])
      return @board[0]
    elsif test_set(@board[2], @board[4], @board[6])
      return @board[2]
    end

    return false
  end

  def test_row(row)
    offset    = row*3
    element_1 = @board[0+offset]
    element_2 = @board[1+offset]
    element_3 = @board[2+offset]

    test_set(element_1, element_2, element_3)
  end

  def test_column(column)
    element_1 = @board[0+column]
    element_2 = @board[3+column]
    element_3 = @board[6+column]

    test_set(element_1, element_2, element_3)
  end

  def test_set(element_1, element_2, element_3)
    if element_1 == element_2 && element_2 == element_3 && !element_1.nil?
      return element_1
    end

    false
  end

  def draw?
    !win? && @board.compact.length == @board.length
  end

  def play_move(player, move) # player is int 1 of 2, en skuif is 1..9
    return 'error' if !valid_move?(move)

    @board[move-1] = token_from_player(player)
  end
end


game = Game.new()

until game.end?
  puts "Player #{game.current_player} must make a move. Please move:"
  puts "A move is a number 1-9 corresponding to the open space"
  game.board.display_board
  input_move = gets.chomp()
  game.play_move(input_move.to_i)
end

game.board.display_board
if game.board.win?
  puts "#{game.board.win?} has won"
else
  puts 'It is a draw'
end
