# Student class - logs test scores and holds grade information for a student
#
# Syntax:
#
# student = Student.new({ name: "Biff", age: 75 })
#
# Methods:
#
# student.log_score(score)
# student.grade
class Student
  attr_reader :name, :age, :scores

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    total_score = 0.0
    average_score = 0.0
    @scores.each_with_index do |score, number_of_tests|
      score = Float(score)
      total_score += score
      average_score = total_score / (number_of_tests + 1)
    end
    average_score
  end
end
