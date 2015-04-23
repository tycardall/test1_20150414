#exe_10_15.rb

arr1 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr1.delete_if { |word| word.start_with?("s") }

arr2 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']


arr2.delete_if { |word| word.start_with?("s", "w") }

p arr1
p arr2