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
    (0..2).each do |offset_multiplyer|
      offset = offset_multiplyer*3
      if @board[0+offset] == @board[1+offset] && @board[1+offset] == @board[2+offset] && !@board[0+offset].nil?
        return @board[0+offset]
      elsif @board[0+offset_multiplyer] == @board[3+offset_multiplyer] && @board[3+offset_multiplyer] == @board[6+offset_multiplyer] && !@board[0+offset_multiplyer].nil?
        return @board[0+offset]
      end
    end

    if @board[0] == @board[4] && @board[4] == @board[8] && !@board[0].nil?
      return @board[0]
    elsif @board[2] == @board[4] && @board[4] == @board[6] && !@board[2].nil?
      return @board [2]
    end

    return false
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
