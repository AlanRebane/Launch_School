#1) Write a program to check for the expression 'lab'
def seq_checker(word)
  if word =~ /lab/
    puts word
  else
    puts "The word does not contain 'lab'."
  end
end

seq_checker('laboratory')
seq_checker('polar bear')

#2) What will the program print to the screen?
def execute(&block)
  block.call
end

p execute { puts "Hello from inside the execute method!" }