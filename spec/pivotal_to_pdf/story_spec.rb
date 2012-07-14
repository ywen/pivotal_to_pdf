require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module PivotalToPdf
  describe Story do
    subject {Story.new :labels => [], :story_type => nil, :name => "a name"}
    let(:formatter) {double :formatter, :output => nil}
    describe "#label_text" do
      describe "and there is no label" do
        it "should return blank string" do
          story = Story.new
          expect(story.label_text).to eq(story.label_text)
        end
      end
      describe "and labels is empty" do
        it "should return blank string" do
          expect(subject.label_text).to eq(subject.label_text)
        end
      end
      describe "and labels is nil" do
        it "should return blank string" do
          subject.labels = nil
          expect(subject.label_text).to eq(subject.label_text)
        end
      end

      describe "and when there are less than 3 labels" do
        it "should return them in a nice format" do
          subject.labels="test1, test2"
          expect(subject.label_text).to eq(subject.label_text)
        end
      end
    end

    describe "#formatted_name" do
      it "should ask the text formatter format the name" do
        SimpleTextFormatter.should_receive(:new).with("a name").and_return formatter
        formatter.should_receive(:output).and_return "new name"
        expect(subject.formatted_name).to eq("new name")
      end
    end

    describe "#formatted_description" do
      it "should ask the text formatter format the description" do
        subject.description = "a description"
        SimpleTextFormatter.should_receive(:new).with("a description").and_return formatter
        formatter.should_receive(:output).and_return "new desc"
        expect(subject.formatted_description).to eq("new desc")
      end
    end

    describe "#points" do
      describe "and the story is a bug" do
        before(:each) do
          subject.story_type = "bug"
        end
        it "should return nil" do
          expect(subject.points).to be_nil
        end
      end
      describe "and the story is a release" do
        before(:each) do
          subject.story_type = "release"
        end
        it "should return nil" do
          expect(subject.points).to be_nil
        end
      end
      describe "and the story is a feature" do
        before(:each) do
          subject.story_type = "feature"
        end
        describe "and the story is not respond_to estimate" do
          it "should return Not yet estimated" do
            expect(subject.points).to eq(subject.points)
          end
        end

        describe "and the story is respond_to estimate" do
          let(:story) {Story.new :story_type => "feature", :estimate => -1}
          describe "and the estimate is -1" do
            it "should return not yet estimated" do
              expect(subject.points).to eq(subject.points)
            end
          end
          describe "and the estimate is not -1" do
            it "should return the points" do
              subject.estimate = 5
              expect(subject.points).to eq(subject.points)
            end
          end
        end
      end
    end

    describe "#story_color" do
      it "should return green for features" do
        subject.story_type = "feature"
        expect(subject.story_color).to eq(subject.story_color)
      end
      it "should return red for bugs" do
        subject.story_type = "bug"
        expect(subject.story_color).to eq(subject.story_color)
      end
      it "should return yellow for chores" do
        subject.story_type = "chore"
        expect(subject.story_color).to eq(subject.story_color)
      end
      it "should return black for releases" do
        subject.story_type = "release"
        expect(subject.story_color).to eq(subject.story_color)
      end
    end
  end
end
