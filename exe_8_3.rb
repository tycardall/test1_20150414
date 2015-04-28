# exe_8_3

name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19 }

p name_and_age.keys {|k| puts k }
p name_and_age.values {|v| puts v }
puts "Name and Age: " 
name_and_age.each { |k, v| puts k.to_s + "  " + v.to_s}
