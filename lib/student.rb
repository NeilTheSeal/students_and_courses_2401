# Student class
#
# Syntax:
#
# student = Student.new({ name: "Biff", age: 75 })
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
end
