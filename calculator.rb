#calculator.rb


def intro
puts ""

puts "Welcome to Cardall_Calc!"
@continue == "Y"
  end
  
def startup
  #initial preload
  @continue = "Y"
  @signs = { "1": "add", "2": "subtract", "3": "multply", "4":"divide" }
   @first = 1
   @second = 1
   @operator = "1"
   @first_ok = "invalid"
   @second_ok = "invalid"
   @signs_ok = "invalid"  
   operator = @operator
   signs = @signs
   puts ""
end
def replay
   @first_ok = "invalid"
   @second_ok = "invalid"
   @signs_ok = "invalid" 
end
    
def collect1
  while @first_ok == "invalid"
    puts "Enter first number Not=0 =>"
    @first = gets.chomp.to_f
    if @first != 0
      @first_ok ="valid"
      puts "1st:  #{@first}" 
      else
      puts "Invalid Entry"  
      @first_ok = "invalid" 
    end
  end 
end

def collectOp
  while @signs_ok =="invalid"
  puts "Enter operator 1=add, 2=subtract, 3=multiply, 4=divide =>"
  @operator = gets.chomp
    if @signs.has_key?(@operator.to_sym)
    @signs_ok = "valid"
    puts "op: #{@operator}"
    else
    puts "Invalid Operator"
    @signs_ok = "invalid"
    end
  end
end    
  
def collect2
  while @second_ok  == "invalid" 
    puts "Enter Second number =>"
    @second = gets.chomp.to_f
    if @second != 0
      @second_ok  = "valid"
      else
      puts "Invalid Entry" 
      @second_ok  = "invalid"
    end        
    if @second == 0
      if @operator == "4"
        @second_ok = "invalid"
        puts "cannot divide by 0"
        else
        @second_ok  = "valid"
      end
    end      
  end
end

def process 
  case 
  when @operator == "1" then 
  @result = @first + @second
  when @operator == "2" then 
  @result = @first - @second
  when @operator == "3" then 
  @result = @first * @second
  when @operator == "4" then 
  @result = @first / @second
  end
  puts "                     #{@first} #{@signs[@operator.to_sym]}  #{@second} = #{@result }"
  end

#core
intro do
    end
startup do
    end
while @continue == "Y" 
  collect1 do
    end       
  collectOp do
    end
  collect2 do
    end 
  process do
    end
  puts "continue? Y or N =>"
  @continue = gets.chomp
  @continue = @continue.upcase        
    if @continue == "N"
    break
    else
    puts " continue: #{@continue} "
    end
  replay do
      end
end
