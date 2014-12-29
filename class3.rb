#1. Have detailed requirements or specifications in written form.
#2. Extract major nouns most likely will map to => classes
#3. Extra major verbs => instance methods. 
#4. Group instance methods into => classes. 

#BlackJack game. 
#Major nouns
class Card
  attr_accessor :suit, :value

  def initialize(s, v)
    @suit = s
    @value = v
  end

  def to_s
    "This is the card #{suit}, #{value}"
  end
end

class Deck
  attr_accessor :cards

  def initialize(num_decks)
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    @cards *= num_decks
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal
    card.pop
  end

end

class Player

end

class Dealer

end

class Blackjack
  attr_accessor :player, :dealer. :deck
  
  def initialize
    @player = Player.new("Bob")
    @dealer = Dealer.new
    @deck = Deck.new
    
  end

  def run
    #procedural code. 
    deal_cards
    show_flow
    player_turn
    dealer_turn
    who_won?
  end


end

Blackjack.new.run










