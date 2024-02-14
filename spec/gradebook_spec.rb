require "rspec"
require "./lib/gradebook"
require "./lib/student"
require "./lib/course"

RSpec.describe "Gradebook" do
  before(:each) do
    @gradebook = Gradebook.new(instructor)
  end

  it "exists" do
    expect(@gradebook).to be_an_instance_of(Gradebook)
  end
end
