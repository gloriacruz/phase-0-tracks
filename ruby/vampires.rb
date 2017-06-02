def load_employee_data
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.to_i
  puts "What year were you born?"
  year = gets.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
  if gets.chomp == "y"
    eats_garlic = true
  else
    eats_garlic = false
  end
  puts "Would you like to enroll in the company’s health insurance? (y/n)"
  if gets.chomp == "y"
    health_insurance = true
  else
    health_insurance = false
  end

  puts "Employee Name: #{name}"
  puts "Age: #{age}"
  puts "Birth year: #{year}"
  puts "Eats garlic: #{eats_garlic}"
  puts "Wants health insurance: #{health_insurance}"
  puts "Vampire status: " + check_vampire_status(name,age,year,eats_garlic,health_insurance)

end

def calculate_age(year)
  # Assuming he/she was born A.D.
  calculated_age = 2017 - year
end

def check_vampire_status(name,age,year,eats_garlic,health_insurance)

  vampire_status = nil

  calculated_age = calculate_age(year)

  if age == calculated_age
    correct_age = true
  else
    correct_age = false
  end

  if correct_age && (eats_garlic || health_insurance)
    vampire_status = "Probably not a vampire"
  end

  if !correct_age && (!eats_garlic || !health_insurance)
    vampire_status = "Probably a vampire"
  end

  if !correct_age  && !eats_garlic && !health_insurance
    vampire_status = "Almost certainly a vampire"
  end

  if name == "Drake Cula" || name == "Tu Fang"
    vampire_status = "Definitely a vampire"
  end

  if vampire_status == nil
    vampire_status = "Results inconclusive"
  end

  return vampire_status

end

load_employee_data
