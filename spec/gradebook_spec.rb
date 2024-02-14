require "rspec"
require "./lib/gradebook"
require "./lib/student"
require "./lib/course"

RSpec.describe "Gradebook" do
  before(:each) do
    @gradebook = Gradebook.new("Stephen Hawking")
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
end
