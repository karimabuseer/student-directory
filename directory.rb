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
# Printing student list
puts 'The students of Villains Academy'
puts '-------------'
students.each { |x| puts x}
# Printing number of students
puts "Overall, we have #{students.count} great students"