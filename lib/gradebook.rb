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

  def students_below(threshold)
    students_below_threshold = []
    @courses.each do |course|
      course.students.each do |student|
        students_below_threshold << student if student.grade < threshold
      end
    end
    students_below_threshold
  end

  def all_grades
    grades_list = {}
    @courses.each do |course|
      grades_list[course] = []
      course.students.each do |student|
        grades_list[course] << student.grade
      end
    end
    grades_list
  end
end
