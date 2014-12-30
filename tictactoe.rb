# stuff.
require 'pry'

class Board
  attr_accessor :board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8],
                   [3,6,9], [1,5,9], [3,5,7]]
  def initialize
    self.board = {}
    (1..9).each {|position| self.board[position] = Square.new(' ')}
  end

  def draw_board
    system "clear" or system "cls"
    puts " #{board[1]} | #{board[2]} | #{board[3]} "
    puts "---+---+---"
    puts " #{board[4]} | #{board[5]} | #{board[6]} "
    puts "---+---+---"
    puts " #{board[7]} | #{board[8]} | #{board[9]} "
  end

  def all_squares_marked?
    empty_squares.size == 0
  end

  def empty_squares
    board.select {|_, square| square.value == ' '}.values
  end

  def empty_positions
    board.select {|_, square| square.empty? }.keys
  end 

  def mark_square(position, marker)
    board[position].mark(marker)
  end

  def winning_condition?(marker)
    WINNING_LINES.each do |line| 
      return true if board[line[0]].value == marker && board[line[1]].value == marker && board[line[2]].value == marker
    end
    false
  end
end

class Square
  attr_accessor :value

  def initialize(v)
    self.value = v
  end

  def mark(marker)
    self.value = marker
  end

  def occupied?
    value != ' '
  end

  def empty?
    value == ' '
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(n, m)
    self.name = n
    self.marker = m
  end
end

class Game
  attr_accessor :game_board, :human, :computer, :current_player
  def initialize
    self.game_board = Board.new
    self.human = Player.new("Tom", 'X')
    self.computer = Player.new("R2D2", 'O')
    self.current_player = human
  end

  def current_player_marks_square
    if current_player == human
      begin
        puts 'Pick a square (1 - 9):'
        position = gets.chomp.to_i
      end until game_board.empty_positions.include?(position)
    else
      position = game_board.empty_positions.sample
    end
    game_board.mark_square(position, current_player.marker)
    game_board.draw_board
  end

  def alternate_player
    if current_player == human
      self.current_player = computer
    else
      self.current_player = human
    end
  end

  def current_player_win?
    game_board.winning_condition?(current_player.marker)
  end

  def self.play_again_check
    begin
      puts "Play again? (Y/N)"
      answer = gets.chomp.downcase
    end until answer == 'y' || answer == 'n'
    answer
  end

  def play
    loop do
      game_board.draw_board
      current_player_marks_square
      if current_player_win?
        puts "Thie winner is #{current_player.name}!"
        break
      elsif game_board.all_squares_marked?
        puts "It's a tie!"
        break
      else
        alternate_player
      end
    end
  end 
end

begin
  Game.new.play
end while Game.play_again_check == 'y'
puts "Bye!"
