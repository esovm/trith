require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "math:fib" do
  it "is implemented" do
    Machine.new.should respond_to(:fib)
  end
end