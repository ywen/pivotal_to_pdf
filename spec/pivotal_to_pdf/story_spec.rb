require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module PivotalToPdf
  describe Story do
    subject {
      Story.new :labels => "test1 test2", :story_type => nil, :name => "a name", :description => "a description"
    }
    let(:formatter) {double :formatter, :output => nil}
    describe "#formatted_labels" do
      context "and there is no label" do
        it "should return blank string" do
          story = Story.new
          expect(story.formatted_labels).to eq("")
        end
      end

      context "and labels is empty" do
        it "should return blank string" do
          subject.labels = ""
          expect(subject.formatted_labels).to eq("")
        end
      end

      context "and labels is nil" do
        it "should return blank string" do
          subject.labels = nil
          expect(subject.formatted_labels).to eq("")
        end
      end

    end

    it_converts_string_through_text_class_on :name, :description, :labels

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
            expect(subject.points).to eq("Points: Not yet estimated")
          end
        end

        describe "and the story is respond_to estimate" do
          let(:story) {Story.new :story_type => "feature", :estimate => -1}
          describe "and the estimate is -1" do
            it "should return not yet estimated" do
              expect(subject.points).to eq("Points: Not yet estimated")
            end
          end
          describe "and the estimate is not -1" do
            it "should return the points" do
              subject.estimate = 5
              expect(subject.points).to eq("Points: 5")
            end
          end
        end
      end
    end

    describe "#story_color" do
      it "should return green for features" do
        subject.story_type = "feature"
        expect(subject.story_color).to eq("52D017")
      end
      it "should return red for bugs" do
        subject.story_type = "bug"
        expect(subject.story_color).to eq("FF0000")
      end
      it "should return yellow for chores" do
        subject.story_type = "chore"
        expect(subject.story_color).to eq("FFFF00")
      end
      it "should return black for releases" do
        subject.story_type = "release"
        expect(subject.story_color).to eq("000000")
      end
    end
  end
end
