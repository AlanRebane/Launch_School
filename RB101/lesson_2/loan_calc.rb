# ----pseudo-code:----

# START

# GET the monthly interest rate for the loan (percentage)
# GET the loan duration in months (# of months)
# GET the total monthly payments by the user (USD amount)

# SET the monthly payments. Calculate this using the user
#     inputed variables.

# PRINT the monthly payment.

# END

def valid_number?(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Hi, I can assist you in calculating your monthly payments!")

loop do
  prompt("First, please enter the total amount of the loan in your local currency:")
  total_loan = nil
  loop do
    total_loan = gets.chomp
    break if valid_number?(total_loan)
    prompt("Hmm, did you input the loan amount? Please try again.")
  end
  total_loan = total_loan.to_f

  prompt("Next, please provide the annual interest rate on your loan
  (where for example Your input of 2.65 points to an Annual
  Percentage Rate of 2.65%):")
  annual_int_rate = nil
  loop do
    annual_int_rate = gets.chomp
    break if valid_number?(annual_int_rate)
    prompt("That does not seem like a valid interest rate. Please input again!")
  end
  annual_int_rate = annual_int_rate.to_f

  prompt("Last, please provide the number of months left to make payments:")
  months_duration = nil
  loop do
    months_duration = gets.chomp
    break if valid_number?(months_duration)
    prompt("Did you input the number of months? Please input again.")
  end
  months_duration = months_duration.to_f

  puts ""
  prompt("Thank you. I have everything I need, I will now make the calculations")

  # Use the formulat to calculate the monthly payments.
  # But first, convert the annual percentage rate into monthly:
  monthly_irate = (annual_int_rate / 100) / 12

  monthly_pay = total_loan * (monthly_irate / \
    (1 - (1 + monthly_irate)**(-months_duration)))

  prompt("Your monthly payment amounts to: #{monthly_pay}")
  prompt("Do you want to make another calulation? (Y for yes)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thanks and goodbye!")
