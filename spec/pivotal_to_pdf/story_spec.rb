require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module PivotalToPdf
  describe Story do
    subject {Story.new :labels => [], :story_type => nil, :name => "a name"}
    let(:formatter) {double :formatter, :output => nil}
    describe "#label_text" do
      describe "and there is no label" do
        it "should return blank string" do
          story = Story.new
          story.label_text.should == ""
        end
      end
      describe "and labels is empty" do
        it "should return blank string" do
          subject.label_text.should == ""
        end
      end
      describe "and labels is nil" do
        it "should return blank string" do
          subject.labels = nil
          subject.label_text.should == ""
        end
      end

      describe "and when there are less than 3 labels" do
        it "should return them in a nice format" do
          subject.labels="test1, test2"
          subject.label_text.should == "test1, test2"
        end
      end
    end

    describe "#formatted_name" do
      it "should ask the text formatter format the name" do
        SimpleTextFormatter.should_receive(:new).with("a name").and_return formatter
        formatter.should_receive(:output).and_return "new name"
        subject.formatted_name.should == "new name"
      end
    end

    describe "#formatted_description" do
      it "should ask the text formatter format the description" do
        subject.description = "a description"
        SimpleTextFormatter.should_receive(:new).with("a description").and_return formatter
        formatter.should_receive(:output).and_return "new desc"
        subject.formatted_description.should == "new desc"
      end
    end

    describe "#points" do
      describe "and the story is a bug" do
        before(:each) do
          subject.story_type = "bug"
        end
        it "should return nil" do
          subject.points.should be_nil
        end
      end
      describe "and the story is a release" do
        before(:each) do
          subject.story_type = "release"
        end
        it "should return nil" do
          subject.points.should be_nil
        end
      end
      describe "and the story is a feature" do
        before(:each) do
          subject.story_type = "feature"
        end
        describe "and the story is not respond_to estimate" do
          it "should return Not yet estimated" do
            subject.points.should == "Points: Not yet estimated"
          end
        end

        describe "and the story is respond_to estimate" do
          let(:story) {Story.new :story_type => "feature", :estimate => -1}
          describe "and the estimate is -1" do
            it "should return not yet estimated" do
              subject.points.should == "Points: Not yet estimated"
            end
          end
          describe "and the estimate is not -1" do
            it "should return the points" do
              subject.estimate = 5
              subject.points.should == "Points: 5"
            end
          end
        end
      end
    end

    describe "#story_color" do
      it "should return green for features" do
        subject.story_type = "feature"
        subject.story_color.should == "52D017"
      end
      it "should return red for bugs" do
        subject.story_type = "bug"
        subject.story_color.should == "FF0000"
      end
      it "should return yellow for chores" do
        subject.story_type = "chore"
        subject.story_color.should == "FFFF00"
      end
      it "should return black for releases" do
        subject.story_type = "release"
        subject.story_color.should == "000000"
      end
    end
  end
end
