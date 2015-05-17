# OOP_1_1

class MyCar 
  attr_accessor :color
  attr_reader :year

   def initialize(year, model, color)
      @year = year
      @model = model
      @color = color
      @current_speed = 0
    end

    def accelerate(number)
        @current_speed += number
        puts "accelerate #{number} mph."
    end
      
    def brake(number)
      @current_speed -= number
      puts "brake-- decelerate #{number} mph."
    end
    def current_speed
      puts "                      Current speed:   #{@current_speed} mph."
    end

    def shut_down
      @current_speed = 0
      puts "Let's park"
    end
end
   
Altima = MyCar.new(2002, 'Nissan Altima', 'Red')
Altima.accelerate(20)
Altima.current_speed
Altima.accelerate(20)
Altima.current_speed
Altima.brake(20)
Altima.current_speed
Altima.brake(20)
Altima.current_speed
Altima.shut_down
Altima.current_speed 
puts"-------------------"
Altima.color = 'black'
puts Altima.color
puts Altima.year
