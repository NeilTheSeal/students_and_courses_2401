# Class Course - a course that takes on students until it has reached capacity.
# When full, it will give course.full? = true and no longer take on students
#
# Sytax:
#
# course = Course.new("Course Name", <int>student_capacity)
#
# Methods:
#
# course.name
# course.capacity
# course.students
# course.full?
# course.enroll(Student.new({...}))
class Course
  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def full?
    @students.length >= @capacity
  end

  def enroll(student)
    @students << student
  end
end
