#blackjack
#***** Not Modular*****

def calculate_total(cards) 
  arr = cards.map{|e| e[1] }
  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end
#Welcome
puts "Please enter your name =>"
@player_name = gets.chomp
@continue = "Y"

# Start Game


puts "Welcome to Blackjack #{@player_name}!"

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
@win_player= 0
@win_comp = 0
@win_tie = 0

while @continue == "Y"
  deck = suits.product(cards)
  deck.shuffle!
       @winner = ""

  # Deal Cards

  mycards = []
  dealercards = []

  mycards << deck.pop
  dealercards << deck.pop
  mycards << deck.pop
  dealercards << deck.pop

  dealertotal = calculate_total(dealercards)
  mytotal = calculate_total(mycards)

  # Show Cards
    puts "House has: "
  dealercards.each do |card|
    puts "#{card}"
    end
    puts "... for a total of #{dealertotal}"
    puts ""
    puts "You have: "
   mycards.each do |card|
    puts "#{card}"
  end
  
  puts "... for a total of: #{mytotal}"
  puts ""

  # Player turn
  if mytotal == 21
    puts "Congratulations, you hit blackjack! You win!"
    @winner = "Player"
    exit
  end

  while mytotal < 21
    puts "What would you like to do? 1) hit 2) stay"
    hit_or_stay = gets.chomp

    if !['1', '2'].include?(hit_or_stay)
      puts "You must enter 1 or 2"
      next
    end

    if hit_or_stay == "2"
      puts "You chose to stay."
      break
    end

    #hit
    new_card = deck.pop
    puts "Dealing card to player: #{new_card}"
    mycards << new_card
    mytotal = calculate_total(mycards)
    puts "Your total is now: #{mytotal}"

    if mytotal == 21
      puts "You hit blackjack! You win!"
      @winner = "Player"
      next
    elsif mytotal > 21
      puts "Sorry, you busted. House wins"
      @winner = "Dealer"
      break
    end
  end

  # Dealer turn

  if dealertotal == 21
    puts "Dealer hit blackjack. House wins."
    @winner = "Dealer"
    exit
  end

  while dealertotal < 17
    #hit
    new_card = deck.pop
    puts "Dealing new card for dealer: #{new_card}"
    dealercards << new_card
    dealertotal = calculate_total(dealercards)
    puts "Dealer total is now: #{dealertotal}"

    if dealertotal == 21
      puts "Dealer hit blackjack. House wins."
      @winner = "Dealer"
      exit
    elsif dealertotal > 21
      puts "Dealer busted You win!"
      @winner = "Player"
      next
    end
  end

# Compare hands

  puts "Dealer's cards: "
  dealercards.each do |card|
    puts "=> #{card}"
  end
  puts ""

  puts "Your cards:"
  mycards.each do |card|
  puts "=> #{card}"
  end
  puts ""

  if dealertotal > mytotal
    puts "Sorry, dealer wins."
    @winner = "Dealer"
  elsif dealertotal < mytotal
    puts "You win!"
    @winner = "Player"
  else
  puts "It's a tie!"
      @winner = "Tie"
  end
  
  #scoreboard
  if @winner == "Player" 
  @win_player = @win_player + 1
    else if
      @winner == "Tie"
      @win_tie =@win_tie + 1
      else if
      @winner == "Dealer"
      @win_comp =@win_comp + 1
      end
    end
  end
puts ""
puts "Totals:  #{@player_name}: #{@win_player}, House: #{@win_comp}, Tie: #{@win_tie}"

  puts "Play again? (y/n)"
    @continue = gets.chomp
    @continue = @continue.upcase
    if @continue == "N"
    exit 
    else
  end

end
