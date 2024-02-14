require "rspec"
require "./lib/gradebook"
require "./lib/student"
require "./lib/course"

# rubocop:disable Metrics/BlockLength
RSpec.describe "Gradebook" do
  before(:each) do
    @gradebook = Gradebook.new("Stephen Hawking")
    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new("Physics", 3)
    @course3 = Course.new("Music", 5)
    @student1 = Student.new({ name: "Morgan", age: 21 })
    @student2 = Student.new({ name: "Jordan", age: 29 })
    @student3 = Student.new({ name: "Abraham Lincoln", age: 215 })
    @student4 = Student.new({ name: "Dwayne 'the Rock' Johnson", age: 51 })
    @student5 = Student.new({ name: "Hayley Williams", age: 35 })
    @student6 = Student.new({ name: "Natalie Portman", age: 42 })
    @student7 = Student.new({ name: "Billie Eilish", age: 22 })
    @student8 = Student.new({ name: "Pope Gregory I", age: 1433 })
    @student9 = Student.new({ name: "X Æ A-XII Musk", age: 3 })
    @student10 = Student.new({ name: "A Literal Cat", age: 5 })
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
    @course2.enroll(@student4)
    @course2.enroll(@student5)
    @course3.enroll(@student6)
    @course3.enroll(@student7)
    @course3.enroll(@student8)
    @course3.enroll(@student9)
    @course3.enroll(@student10)
    @student1.log_score(50)
    @student1.log_score(75)
    @student2.log_score(60)
    @student2.log_score(85)
    @student3.log_score(70)
    @student3.log_score(95)
    @student4.log_score(60)
    @student4.log_score(70)
    @student5.log_score(80)
    @student5.log_score(90)
    @student6.log_score(90)
    @student6.log_score(100)
    @student7.log_score(20)
    @student7.log_score(50)
    @student8.log_score(50)
    @student8.log_score(50)
    @student9.log_score(85)
    @student9.log_score(75)
    @student10.log_score(90)
    @student10.log_score(75)
    # students below 75 - student1, student2, student4, student7, student8
  end

  it "exists" do
    expect(@gradebook).to be_an_instance_of(Gradebook)
  end

  describe "#initialization" do
    it "has an instructor" do
      expect(@gradebook.instructor).to eq("Stephen Hawking")
    end
    it "has a list of courses" do
      expect(@gradebook.courses).to eq([])
    end
  end

  describe "#add courses" do
    it "can add courses" do
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)
      expect(@gradebook.add_course(@course3)).to eq([
        @course1, @course2, @course3
      ])
      expect(@gradebook.courses).to eq([@course1, @course2, @course3])
    end
  end

  describe "#student statistics" do
    it "can list all students" do
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)
      @gradebook.add_course(@course3)
      expect(@gradebook.list_all_students).to eq({
        @course1 => [@student1, @student2],
        @course2 => [@student3, @student4, @student5],
        @course3 => [@student6, @student7, @student8, @student9, @student10]
      })
    end
    it "can list all students below a grade threshold" do
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)
      @gradebook.add_course(@course3)
      expect(@gradebook.students_below(75)).to eq([
        @student1, @student2, @student4, @student7, @student8
      ])
    end
    it "can list all grades for each course" do
      @gradebook.add_course(@course1)
      @gradebook.add_course(@course2)
      @gradebook.add_course(@course3)
      expect(@gradebook.all_grades).to eq({
        @course1 => [62.5, 72.5],
        @course2 => [82.5, 65, 75],
        @course3 => [95, 55, 30, 80, 82.5]
      })
    end
  end
end
# rubocop:enable Metrics/BlockLength
