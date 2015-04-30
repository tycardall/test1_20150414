#Wk_1_4.rb

puts "Enter First Name"
fname = gets.chomp
puts "Enter Last Name"
lname = gets.chomp
puts fname+" "+lname

name1 = {"first"=> fname, "last" => lname} 

  puts "Hello #{name1["first"]}"