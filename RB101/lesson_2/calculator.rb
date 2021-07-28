require 'yaml'
MESSAGES = YAML.load_file('calculator_languages.yml')['en']

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def operation_to_message(op)
  op = case op
  when '1'
    MESSAGES['add']
  when '2'
    MESSAGES['sub']
  when '3'
    MESSAGES['mult']
  when '4'
    MESSAGES['div']
  end
  op
end

prompt(MESSAGES['msg_welcome'])
name = ''

loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['name_error'])
  else
    break
  end
end

prompt(MESSAGES['hi_name'] + ' ' + name + "!")

loop do # main loop
  number1 = nil # we have to initialize a number outside the loop!
  loop do
    prompt(MESSAGES['first_num'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['num_error'])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES['sec_num'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['num_error'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt(operation_to_message(operator) + " " + MESSAGES['two_nums'])

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(MESSAGES['result'] + result.to_s)

  prompt(MESSAGES['new_calc?'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])