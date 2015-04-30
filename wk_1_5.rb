#Wk_1_5.rb

def my_method(arr)
  arr.uniq!
  arr.pop
end
#mutated caller
my_arr = [1, 2, 2, 3]
my_method(my_arr)
p my_arr
