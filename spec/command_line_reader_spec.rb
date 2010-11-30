require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe CommandLineReader do
  attr_reader :command_line_reader
  before(:each) do
    @command_line_reader = CommandLineReader.new
  end

  it "should list available options if passed in -h" do

  end
end

