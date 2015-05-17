#bj_oo.rb
require "pry"
class Card
  attr_accessor :suit, :face_value
  
  def initialize(s, fv)
  @suit = s
  @face_value = fv
  end
  
  def pretty_ouput
    "The #{face_value} of #{find_suit}"
  end
 
  def to_s
      pretty_ouput
    end
    
  def find_suit
    case suit
      when 'H' then 'Hearts'
      when 'D' then 'Diamonds'
      when 'S' then 'Spades'
      when 'C' then 'Clubs'
    end  
  end
  
end

class Deck
  attr_accessor :cards
  
  def initialize
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
      scramble!
  end
  
  def scramble!
    cards.shuffle!
  end
  
  def deal_one
    cards.pop
  end
  
  def size
    cards.size
  end
  
end

module Hand

  
  def show_hand
    puts
    puts "-----#{name}'s hand -------"
    cards.each do|card|
      puts "=> #{card}"
    end
      puts "=> Total: #{total}"
  end
  
  def total
    face_values = cards.map{|card| card.face_value }
    
    total = 0
    face_values.each do |val|
    if val == "A"
    total += 11
    else
    total += (val.to_i == 0 ? 10 :val.to_i)
    total
    end
  end
    #correct for aces
    face_values.select{|val| val == "A"}.count.times do
    break if total <= Blackjack::BLACKJACK_AMOUNT
    total -= 10
    end
  total
  end
  
  def add_card(new_card)
  cards << new_card
  end
  
  def is_busted?
    if total > Blackjack::BLACKJACK_AMOUNT
    true
    end
  end
  

  end
  
class Player
  include Hand
  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end
  
  def show_flop
  show_hand
  end
end
  
class Dealer < Player
include Hand
attr_accessor :name, :cards
  def initialize
    @name = "Dealer"
    @cards = []
  end
  
  def show_flop
  puts "-----Dealer's hand -------"
  puts "=> First card is hidden"
  puts "Second card is #{cards[1]}"
  end

end

class Blackjack
include Hand
  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

attr_accessor :deck, :player, :dealer
  def initialize
  @deck = Deck.new
  @player = Player.new("Human")
  @dealer = Dealer.new
  end
  
  def set_player_name
    puts "Enter Player Name:"
    player.name = gets.chomp
  end
    
  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end
  
  def show_flop
    player.show_flop
    dealer.show_flop
  end
  
  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT

      if player_or_dealer.is_a?(Dealer)
      puts "Dealer hit Blackjack.  #{player.name} lost."
      else
        puts "#{player.name} hit Blackjack.  #{player.name} won"
      end
      play_again?
    elsif player_or_dealer.is_busted?

      if player_or_dealer.is_a?(Dealer)
      puts "Dealer Busted.  #{player.name} won."
      else
        puts "#{player.name} Busted.  #{player.name} lost"
      end
      play_again?
    end
    
  end 
  
  def player_turn
    puts "#{player.name}'s turn."

    blackjack_or_bust?(player)
   
    while !player.is_busted?
      puts "What would you like to do 1) hit, 2) stay"
      response = gets.chomp
      if !['1', '2'].include?(response)
        puts "Error:  You must enter 1 or 2"
      next
      end
        if response == "2"
        puts "#{player.name} chose to stay"
        break
      end

      #hit
      new_card = deck.deal_one
      puts "Dealing new card to #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total is now #{player.total}"
      
      blackjack_or_bust?(player)
    end
     puts "#{player.name} stays at #{player.total}"
  end
  
  def dealer_turn
    puts "Dealer's turn"
    blackjack_or_bust?(dealer)
    while dealer.total < DEALER_HIT_MIN
    new_card = deck.deal_one
    puts "Dealing new card to dealer: #{new_card}"
    dealer.add_card(new_card)
    puts "Dealer's total is now #{dealer.total}"
    blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}"
  end
  
  def who_won?
    if player.total > dealer.total
    puts "#{player.name} won."
    elsif player.total < dealer.total
    puts "#{player.name} lost."
    else
    puts "It's a tie"
    end
    play_again?
  end
  
  def play_again?
    puts ""
    puts "Play again? 1) Yes, 2) No, Exit"
    if gets.chomp == "1"
      puts "Starting new game..."
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye"
      exit
    end
  end
  
  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
  end
end

game = Blackjack.new
game.start


