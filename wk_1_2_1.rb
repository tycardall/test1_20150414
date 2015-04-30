#Wk_1_2_1.rb

arr1 = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
puts ""
puts "Contains 'lab' "
puts "-------------"

arr1.each do|word| 
if word.include? "lab"
  puts word
  else
  puts "#{word}:  No Match  "
  end 
end


  


