# Creating student array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

# Method to print header
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# Method to list names
def print(names)
  names.each_with_index { |x, i| puts "#{i+1}. #{x[:name]} (#{x[:cohort]} cohort)" } 
end

# Method to print names that begin with a certain letter
def specific_letter(names)
  puts 'You can use this list to look up students whose name starts with a specific letter.'
  puts 'What letter would you like to search for?'
  speclet = gets.chomp
  names.each { |x| puts "# #{x[:name]} (#{x[:cohort]} cohort)" if x[:name].start_with?(speclet) }
end  
# Method to print names that are under 12 characters
def specific_letter(names)
  puts 'List of students whose name is under 12 characters:'
  names.each { |x| puts "# #{x[:name]} (#{x[:cohort]} cohort)" if x[:name].length < 12 }
end  
#Method to print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Main program
students = input_students
print_header
print(students)
print_footer(students)