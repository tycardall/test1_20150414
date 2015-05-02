#tictactoe.rb

#setup
def setup
@s1 = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}
@s2 = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
@select_comp = Array.new
@select_player = Array.new
@win_player= 0
@win_comp = 0
@win_tie = 0
@entry_valid = "invalid"
@continue = "Y"
@choice_player = 0
@choice_computer = 0
@winner = ""
end

#draw_game
def draw_game
      system ("cls") 
  puts "   |   |"
  puts " #{@s1[1]} | #{@s1[2]} | #{@s1[3]} "
  puts "   |   |"
  puts "---+---+---" 
  puts "   |   |"
  puts " #{@s1[4]} | #{@s1[5]} | #{@s1[6]} "
  puts "   |   |"
  puts "---+---+---" 
  puts "   |   |"
  puts " #{@s1[7]} | #{@s1[8]} | #{@s1[9]} "
  puts "   |   |"  
end

#select spaces
def select
  while @winner == ""
    while @entry_valid == "invalid"
      puts "Enter the number for a square"
      puts "remaining choices are: #{@s2}" 
      @choice_player = gets.chomp.to_i
      if @s2.include?(@choice_player)
        @entry_valid = "valid"
        @select_player.push(@choice_player)
        @s1[@choice_player] = "X"
        @select_player = @select_player.sort
        @s2.delete(@choice_player)
        @choice_computer = @s2.sample
        @s1[@choice_computer] = "O"
        @select_comp.push(@choice_computer)
        @select_comp = @select_comp.sort
        @s2.delete(@choice_computer)      
        draw_game do
                  end
        result do
                end
        else
        puts "invalid entry...try again"
        @entry_valid = "invalid"
      end
    end
        @entry_valid = "invalid"
  end 
end

#result
def result
@win = [[1, 2, 3], [4, 5, 6], [7, 8, 9],[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  case
    when @win.include?(@select_comp)
    puts "Winner: computer"
    @winner = "computer"
          @entry_valid = "valid"
    when @win.include?(@select_player)
    puts "Winner:  player"
    @winner = "player"
          @entry_valid = "valid"
    when @s2.length <= 1
    @winner = "Tie"
          @entry_valid = "valid"
  end

end

#scoreboard
def scoreboard

  if @winner == "player" 
  @win_player = @win_player + 1
    else if
      @winner == "Tie"
      @win_tie = @win_tie + 1
      else if
      @win_comp = @win_comp + 1
      end
    end
  end
puts "Totals:  player: #{@win_player}, computer: #{@win_comp}, Tie: #{@win_tie}"
end

def replay
@s1 = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}
@s2 = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
@select_comp = []
@select_player = []
@winner = ""
draw_game do
          end
end
  
#core
#------------------------------------------
setup do
      end
draw_game do
          end
while @continue == "Y"
  select do 
         end
  scoreboard do
             end  
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