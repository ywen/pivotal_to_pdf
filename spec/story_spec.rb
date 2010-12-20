require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe Story do
  let(:story){Story.new :labels => []}
  describe "when asked for label text" do
    describe "and there is no label" do
      it "should return blank string" do
        story = Story.new
        story.label_text.should == ""
      end
    end
    describe "and labels is empty" do
      it "should return blank string" do
        story.label_text.should == ""
      end
    end
    describe "and labels is nil" do
      it "should return blank string" do
        story.labels = nil
        story.label_text.should == ""
      end
    end

    describe "and when there are less than 3 labels" do
      it "should return them in a nice format" do
        story.labels="test1, test2"
        story.label_text.should == "test1, test2"
      end
    end
  end
end
