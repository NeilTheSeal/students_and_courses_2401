# Gradebook class - a container for Course and Student objects that tracks
# student test scores across different courses. There are methods to list all
# students for each class and provide a list of students below a certain
# grade threshold
#
# Syntax:
#
# gradebook = Gradebook.new("Instructor name")
#
# Methods:
# gradebook.instructor
# gradebook.courses
# gradebook.add_course(Course.new(...))
# gradebook.list_all_students
# gradebook.students_below(<int || float>threshold)
class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    student_list = {}
    @courses.each do |course|
      student_list[course] = []
      course.students.each do |student|
        student_list[course] << student
      end
    end
    student_list
  end
end
