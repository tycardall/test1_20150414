#ex_5_3
target = ()

puts "Enter Number greater than 0:"

target = gets.chomp.to_i



if target < 50
puts "number is between 0 and 50"
elsif target <= 100
puts "number is between 50 and 100"
else
puts "number is greater than 100"
end
