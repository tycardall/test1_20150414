#ex_3_4 fullname.rb
puts "your first name?"
fname = gets.chomp.to_s
puts "your last name?"
lname = gets.chomp.to_s
name = fname + " " + lname

i = 0
10.times do |i|
puts "Are you sure your name is " + name + "?"
i = i + 1
end


