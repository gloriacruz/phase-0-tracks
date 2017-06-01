def load_employee_data
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.to_i
  puts "What year were you born?"
  year = gets.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
  want_garlic = gets.chomp
  puts "Would you like to enroll in the company’s health insurance? (y/n)"
  health_insurance = gets.chomp
end

load_employee_data