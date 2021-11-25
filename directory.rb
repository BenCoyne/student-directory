@students = [] # an empty array accessible to all methods

def insert_student
  puts "Enter the name of the student: "
  puts "To finish, just hit return twice."
  # Get the first name.
  name = gets.chomp
  # While the name is not empty, repeat this code.
  while !name.empty? do
    # add the student hash to the @students array.
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name from the user.
    puts "Enter Student's name or hit return to finish: "
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Sve the list to students.csv"
  puts "9. Exit"
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
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, try again."
  end
end

def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
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

interactive_menu
