@students = []
# Creating student array
def input_students
  months = ["january", "febuary", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students one by one"
  puts "To finish, just hit return twice when asked for name"
  name = STDIN.gets.delete("\n")
  while !name.empty? do
    puts "What cohort are they in? If you want the default cohort, hit return"
    coh = 'placehold'
    until months.include?(coh) || coh.empty? do
      coh = STDIN.gets.chomp
      if coh.strip.empty? && !months.include?(coh)
        students << {name: name, cohort: :november, birth_country: :England}
      else
        students << {name: name, cohort: coh.to_sym, birth_country: :England}
      end
    end
    puts students.length < 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    name = STDIN.gets.chomp
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
  if names == nil
    puts 'No students enrolled yet.'
    return
  end
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
  speclet = STDIN.gets.chomp
  names.each { |x| puts "# #{x[:name]} (#{x[:cohort]} cohort)" if x[:name].start_with?(speclet) }
end  
# Method to print names that are under 12 characters
def specific_letter(names)
  puts 'List of students whose name is under 12 characters:'
  names.each { |x| puts "# #{x[:name]} (#{x[:cohort]} cohort)" if x[:name].length < 12 }
end  
#Method to print footer
def print_footer(names)
  puts names.to_a.length == 0 ? "We have no students" : "Overall, we have #{names.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant. Please try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  # Iterate over the student array of hashes
  @students.each { |x| 
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  }
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line| 
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym, birth_country: :England}
    end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# Main program
try_load_students
interactive_menu
