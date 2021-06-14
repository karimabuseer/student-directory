# Creating student array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vater", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# Method to print header
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# Method to list names
def print(names)
  names.each { |x| puts "#{x[:name]} (#{x[:cohort]} cohort)" } 
end

#Method to print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Main program
print_header
print(students)
print_footer(students)