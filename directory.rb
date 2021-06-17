# Creating student array
def input_students
  months = ["january", "febuary", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students one by one"
  puts "To finish, just hit return twice when asked for name"
  students = []
  name = gets.delete("\n")
  while !name.empty? do
    puts "What cohort are they in? If you want the default cohort, hit return"
    coh = 'placehold'
    until months.include?(coh) || coh.empty? do
      coh = gets.chomp
      if coh.strip.empty? && !months.include?(coh)
        students << {name: name, cohort: :november, birth_country: :England}
      else
        students << {name: name, cohort: coh.to_sym, birth_country: :England}
      end
    end
    puts students.length < 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
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
  i = 0
  while i < names.length
    puts "#{i+1}. #{names[i][:name]} (#{names[i][:cohort]} cohort)".center(30)
    i += 1
  end  
end

# Method to print list of students grouped by Cohort
def cohort_print
  cohortlist = []
  students.each { |stu| cohortlist << x[cohort] }
  cohortlist.each { |coh| 
    puts coh
    z = students.collect{|p| p[:name] if p[:cohort] == coh}.compact
    puts z }
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
  puts names.length == 0 ? "We have no students" : "Overall, we have #{names.count} great students"
end

# Main program
students = input_students
print_header
print(students)
print_footer(students)