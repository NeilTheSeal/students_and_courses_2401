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
end
