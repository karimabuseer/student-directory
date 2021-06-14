# Creating student array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vater",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator","Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# Method to print header
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# Method to list names
def print(names)
  names.each { |x| puts x}
end

#Method to print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Main program
print_header
print(students)
print_footer(students)