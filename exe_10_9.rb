#exe_10_9.rb

h = {a:1, b:2, c:3, d:4}
p h
h[:e] = 5

#puts h[:b].to_i

h.delete_if { |k, v| v < 3.5 }
p h