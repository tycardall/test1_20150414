#exe_9_3.rb

def execute(&block)
  
  block.call
end

execute { puts "Hello from inside the execute method!" }