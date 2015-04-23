#exe_9_1.rb

target = "lab"
puts target.to_s

def find1(word)

  if /lab/ =~ word
    puts word
  else
    puts "No match"
  end
end


find1("laboratory")
find1("experiment")
find1("Pans Labyrinth")
find1("elaborate")
find1("polar bear")