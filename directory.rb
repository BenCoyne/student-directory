# First we make an array full of our villainous students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"]

# We then create a few methods to help display our data
def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |name| puts name }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Nothing happens until we call out methods

print_header
print(students)
print_footer(students)