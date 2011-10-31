require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module PivotalToPdf
  describe SimpleTextFormatter do
    subject {SimpleTextFormatter.new "a text"}
    describe "#output" do
      context "when there is no special formatting" do
        it "should return the string" do
          subject.output.should == "a text"
        end
      end
      context "when there is bold special formatting" do
        it "should return the string converted" do
          formatter = SimpleTextFormatter.new "a *special test* text"
          formatter.output.should == "a <b>special test</b> text"
        end
      end
      context "when there is italic special formatting" do
        it "should return the string converted" do
          formatter = SimpleTextFormatter.new "a _special test_ text"
          formatter.output.should == "a <i>special test</i> text"
        end
      end
    end
  end
end
