require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

describe Story do
  let(:story){Story.new :labels => [], :story_type => nil}
  describe "#label_text" do
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

  describe "#points" do
    describe "and the story is not a feature" do
      before(:each) do
        story.story_type = "bug"
      end
      it "should return nil" do
        story.points.should be_nil
      end
    end
    describe "and the story is a feature" do
      before(:each) do
        story.story_type = "feature"
      end
      describe "and the story is not respond_to estimate" do
        it "should return Not yet estimated" do
          story.points.should == "Points: Not yet estimated"
        end
      end

      describe "and the story is respond_to estimate" do
        let(:story) {Story.new :story_type => "feature", :estimate => -1}
        describe "and the estimate is -1" do
          it "should return not yet estimated" do
            story.points.should == "Points: Not yet estimated"
          end
        end
        describe "and the estimate is not -1" do
          it "should return the points" do
            story.estimate = 5
            story.points.should == "Points: 5"
          end
        end
      end
    end
  end

  describe "#story_color" do
    it "should return green for features" do
      story.story_type = "feature"
      story.story_color.should == "52D017"
    end
    it "should return red for bugs" do
      story.story_type = "bug"
      story.story_color.should == "FF0000"
    end
    it "should return yellow for chores" do
      story.story_type = "chore"
      story.story_color.should == "FFFF00"
    end
  end
end
