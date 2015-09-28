require_relative 'student'
require_relative 'teacher'

# Student.find_each do |student|
#   student.teacher = Teacher.all.sample
#   student.save!
# end

# Teacher.find_each do |teacher|
  # puts "#{teacher.first_name} #{teacher.last_name}'s students' IDs"
#   teacher.students.each do |student|
#     print "#{student.id} "
#   end
#   puts "\n"
# end

Student.find_each do |student|
  student.teachers.clear
  student.teachers << Teacher.all.sample(rand(1..3))
  student.save!
end

student = Student.find(rand(1..50))

puts "Student name: #{student.first_name}\nStudent ID: #{student.id}"
puts "#{student.first_name}'s teachers is/are:"
student.teachers.find_each do |teacher|
  puts "#{teacher.first_name} #{teacher.last_name}"
end

puts ""

Teacher.find_each do |teacher|
  puts "#{teacher.first_name} #{teacher.last_name}'s students' IDs:"
  teacher.students.each do |student|
    print "#{student.id} "
  end
  puts "\n"
end