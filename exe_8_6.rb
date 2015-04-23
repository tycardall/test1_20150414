# exe_8_6

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
          
result = {}
p words


words.each do |word|
  key = word.split('').sort.join

  if result.has_key?(key)
    result[key].push(word)

  else
    result[key] = [word]
    
  end
end

result.each do |k, v|
  puts "------"
  p k, v
end