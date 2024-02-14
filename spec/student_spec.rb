require "rspec"
require "./lib/student"

RSpec.describe Student do
  before(:each) do
    @student = Student.new({ name: "Morgan", age: 21 })
  end

  it "exists" do
    morgan = Student.new({ name: "Morgan", age: 21 })
    expect(morgan).to be_instance_of(Student)
  end

  describe "#check attributes at initialization" do
    it "has a name" do
      expect(@student.name).to eq("Morgan")
    end
    it "has an age" do
      expect(@student.age).to eq(21)
    end
    it "has empty scores array" do
      expect(@student.scores).to eq([])
    end
  end
end
