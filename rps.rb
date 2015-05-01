#rps.rb
def welcome
  puts "Welcome"
  #initialize"
  @CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => "Scissors"}
  @GAME_VALUE = {'p' => 1, 's' => 2, 'r' => 3}
  @result_msg = [ ' ', 'paper covers rock', 'scissors cuts paper', 'rock breaks scissors']
  @entry_valid = "invalid"
  @comp_win = 0 
  @player_win = 0
  @tie_win = 0
  @continue = "Y"
end
#players select
def select
  while @entry_valid == "invalid"
    puts "Enter your choice: p,r,s"
    @player_choice = gets.chomp
    @player_choice = @player_choice.downcase
    if @CHOICES.keys.include?(@player_choice)
      @entry_valid = "valid"
    else
      puts "invalid entry...try again"
    end
  end
      @computer_choice = @CHOICES.keys.sample
      puts "Player:  #{@CHOICES[@player_choice]}"
      puts "Computer: #{@CHOICES[@computer_choice]}"
                 
end
#result
def result 
comp_play = @GAME_VALUE[@computer_choice] * 10
player_play = @GAME_VALUE[@player_choice]
result = comp_play + player_play
      wrt = [11, 22, 33]
      wrc = [13, 21, 32]
      wrp = [12, 23, 31]
      scp = [12, 21]
      rbs = [32, 23]
      pcr = [13, 31]

  if wrt.include?(result)
    puts "Tie"
    @winner = "Tie"
    else if wrc.include?(result)
    puts "Computer Wins"
    @winner = ""
      else if wrp.include?(result)
    puts "You win"
    @winner = "player"
      end
    end
  end
  
    if  scp.include?(result)
      sayout = @result_msg[2]
      puts "#{sayout}"
      else if rbs.include?(result)
          sayout = @result_msg[3]
          puts "#{sayout}"
        else if pcr.include?(result)
            sayout = @result_msg[1]
            puts "#{sayout}"
        end
      end
    end
end

#scoreboard
def scoreboard
 
  if @winner == "player" 
  @player_win = @player_win + 1
    else if
      @winner == "Tie"
      @tie_win = @tie_win + 1
      else if
      @comp_win = @comp_win + 1
      end
    end
  end
puts "player: #{@player_win}, computer: #{@comp_win}, Tie: #{@tie_win}"
end

def replay
@continue = "Y"
@entry_valid = "invalid"
end


#core
welcome do
end
while @continue == "Y"
  select do 
  end
  result do 
  end
  scoreboard do
  end
#continue?
  puts "Play again? (y/n)"
  @continue = gets.chomp
  @continue = @continue.upcase
  if @continue == "N"
  break 
  else
  end
  replay do
  end
  
end