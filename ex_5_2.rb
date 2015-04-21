#ex_5_2

target =()

def cap(target)
target.upcase!
end

puts "Enter Greeting:"
target = gets.chomp.to_s
glength = target.length

if glength > 10
cap(target)
end

puts target


# this is another long greeting