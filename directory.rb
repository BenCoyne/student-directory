# We first create some methods to help take and display:

def insert_student
  # Prompt the user for the name of the student they wish to add.
  puts "Enter Student's name: "
  puts "To finish, just hit return twice."
  # Create an empty array.
  students = []
  # Get the first name.
  name = gets.chomp
  # While the name is not empty, repeat this code.
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user.
    name = gets.chomp
  end
  # return the students array.
  students
end

def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Nothing happens until we call out methods.
students = insert_student
print_header
print(students)
print_footer(students)