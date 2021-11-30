@students = [] # an empty array accessible to all methods

puts "------------------------------------------------".center(100)
puts "Welcome to the Villains Academy Student Database".center(100)
puts "  ------------------------------------------------\n\n".center(100)

def insert_student
  puts "Enter the name of the student: "
  puts "To finish, just hit return twice."
  print ">> "
  # Get the first name.
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code.
  while !name.empty? do
    # add the student hash to the @students array.
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name from the user.
    puts "Enter Student's name or hit return to finish: "
    print ">> "
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load saved students from students.csv"
  puts "9. Exit"
  print ">> "
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      insert_student
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, try again."
  end
end

def print_header
  puts "The Students of Villains Academy"
  puts "------------------------------"
end

def print_students_list
  @students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "------------------------------"
  if @students.count == 0
    puts "We currently have no students enrolled\n"
  elsif @students.count == 1
      puts "Overall, we have #{@students.count} great student\n"
  else
    puts "Overall, we have #{@students.count} great students\n"
  end
  puts "------------------------------\n\n"
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  # open the file for reading
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",") 
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of this method if no filename is given
  if File.exists?(filename) # if the File does exist
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if File doesn't exist
    puts "Sorry... #{filename} does not exist."
    exit # quit the program
  end 
end

try_load_students
interactive_menu

