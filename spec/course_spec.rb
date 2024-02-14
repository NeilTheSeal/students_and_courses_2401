require "rspec"
require "./lib/course"
require "./lib/student"

RSpec.describe Course do
  before(:each) do
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({ name: "Morgan", age: 21 })
    @student2 = Student.new({ name: "Jordan", age: 29 })
  end

  it "exists" do
    expect(@course).to be_an_instance_of(Course)
  end

  describe "#initialization" do
    it "has a name" do
      expect(@course.name).to eq("Calculus")
    end
    it "has a capacity" do
      expect(@course.capacity).to eq(2)
    end
    it "has a list of students" do
      expect(@course.students).to eq([])
    end
  end

  describe "#add students" do
    it "is not full when students is less than capacity" do
      expect(@course.full?).to eq(false)
    end
  end
end
