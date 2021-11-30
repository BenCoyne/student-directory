@students = [] # an empty array accessible to all methods

puts "------------------------------------------------".center(100)
puts "Welcome to the Villains Academy Student Database".center(100)
puts "  ------------------------------------------------\n\n".center(100)

def insert_student
  puts "Enter the name of the students"
  puts "To finish, hit return twice"
  print ">> "
  @name = STDIN.gets.chomp
  while !@name.empty?  do
    puts "Enter student's age:"
    @age = STDIN.gets.chomp.to_i
    puts "Enter student's location:"
    @location = STDIN.gets.chomp
	  puts "Enter cohort:"
    @cohort = STDIN.gets.chomp
	  if @cohort == ""
		  @cohort = :December
	end
	add_student
  puts "We now have #{@students.count} students."
  puts "Input the name of another student or hit Enter to finish "
  print ">> "
  @name = STDIN.gets.chomp
  end  
  @students
end

def add_student
  @students << {name: @name, age: @age, location: @location, cohort: @cohort}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu 
  puts "1. Input new student"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
  puts "5. Sort students by info"
  puts "9. Exit"
  print ">> "
end

def show_students
  print_header
  print_students
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
    when "5"
      sort_students
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

def print_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}) #{student[:name]} | #{student[:age]} years old | Location: #{student[:location]} | (#{student[:cohort]} cohort)"
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

def save_students(filename = "students.csv")
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:location], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Save made to #{filename}"
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
	@name, @age, @location, @cohort, = line.chomp.split(',')
	add_student
  end
  puts "Loaded #{@students.count} students from #{filename}"
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

def sort_students
  puts "Sort students by: name, age, location or cohort" 
  print ">> "
  sorter = gets.chomp.to_sym
    if sorter.empty?
      sort_students
    end
  students = @students.sort_by! { |student| student[sorter] }
end

try_load_students
interactive_menu

