#rps_oo.rb
#resend 20150512


class Hand
    include Comparable
    attr_reader :value
    
  def initialize(v)
    @value = v
  end
  
  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p' && another_hand.value == 'r') ||      (@value == 'r' && another_hand.value == 's') ||
          (@value == 's' && another_hand.value == 'p')
      1
    else
      -1
    end
  end
  
  def display_winning_message
    case @value
    when 'p'
      puts "                      Paper wraps Rock"
    when 'r' 
      puts "                      Rock smashes Scissors"
    when 's'
      puts "                      Scissors cuts Paper"
    end
  end
 end
 
class Player
  include Comparable
  attr_accessor :hand, :score
  attr_reader :name  

  def initialize(n)
    @name = n
  end
  
  def to_s
    "#{name}'s choice was #{self.hand.value} |" 
  end
end

class Human < Player
  def pick_hand  
    begin
      puts "Pick Hand:  (P,S,R) => "
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
  CHOICES = {'p' => 'paper', 's' => 'scissors', 'r' => 'rock' }
  attr_reader :player, :computer, :score
  @Player = 0
  @computer = 0
  @score = 0
  @comp_win = 0
  @player_win = 0
  
  class Score < Game
  attr_accessor :score
   def initialize(s)
    @score = s
    end
  end
 
   def scorecard
    puts "                      Total Score:  #{player.name}: #{@player_win}  #{computer.name}: #{@comp_win}"
  end

  def initialize
    @player = Human.new('Human' )
    @computer = Computer.new('Cyber' )
      @score = 0
  @comp_win = 0
  @player_win = 0
  end
  
  def compare_hands
    if player.hand == computer.hand
      puts "                      It's a tie"
    elsif player.hand > computer.hand
      player.hand.display_winning_message
      puts "                      #{player.name} Won!"
        @player_win = @player_win + 1
    else
      computer.hand.display_winning_message
      puts"                      #{computer.name} Won!"
      @comp_win = @comp_win + 1

    end
  end
  

  def play

    until @continue == 'n'
    @continue = 'y'
    system "cls"
    puts"================="
    puts"      R-P-S"
    puts"================="    
    player.pick_hand
    computer.pick_hand
    puts player
    puts computer
    compare_hands
    scorecard
#binding.pry
    puts "Continue?  (<Enter> or N to Quit) => "
    @continue = gets.chomp.downcase
    if @continue == 'n'
    exit
    end
    end
  end
end

game = Game.new.play