require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "math:sinh" do
  it "is implemented" do
    Machine.new.should respond_to(:sinh)
  end
end