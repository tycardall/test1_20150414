# exe_6_4.rb

i = ()

puts "Enter Start"
i = gets.chomp.to_i


def countdown(i)
  while i > 0
  puts i
  i -= 1
  end
 end
countdown(i)