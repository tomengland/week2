#paper rock scissors. 
#write out the description
#Trying to build a game that a player can choose rock paper or scissors
#and compete with the computer who is also

# PRS is a game between two players. 
# Both players pick a hand of either 'paper', 'rock', or 'sicssors'.
# Game compares both hands. if hands are the same it's a tie.  
#Player, Hand, Game

class Hand
  include Comparable
  attr_reader :value

  def initialize(v)
    @value = v
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p' && another_hand.value == 'r') || (@value == 'r' && another_hand.value == 's') || (@value == 's' && another_hand.value == 'p')
      1
    else
      -1
    end  
  end
end

class Player
  attr_accessor :name
  attr_accessor :hand
  
  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} currently has a hand of #{Game::CHOICES[self.hand.value]}"
  end
end

class Human < Player
  def pick_hand
    begin
      puts 'Choose one: (P/R/S)'
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)
    self.hand = Hand.new(c)
  end
end

class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample) 
  end
end



class Game
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  attr_reader :player, :computer

  def initialize
    @player = Human.new("Tom")
    @computer = Computer.new("R2D2")
  end

  def play
    begin
      player.pick_hand
      computer.pick_hand
      puts player
      puts computer
      compare_hands
    end while play_again_check == 'y'
  end
  
  def play_again_check
    begin
      puts "Play again? (Y/N)"
      answer = gets.chomp.downcase
    end until answer == 'y' || answer == 'n'
    answer
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif player.hand > computer.hand
      puts "#{player.name} Won!"
    else
      puts "#{computer.name} Won!"
    end     
  end
end

game = Game.new.play
