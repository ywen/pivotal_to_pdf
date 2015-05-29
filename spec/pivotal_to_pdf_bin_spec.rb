require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
load File.expand_path(File.join(File.dirname(__FILE__), "..", "bin", "pivotal_to_pdf"))

describe 'PivotalToPdf Bin' do
  context "when passed in story sub command" do
    it "should call story with more than one id" do
      PivotalToPdf::Main.should_receive(:story).with([123,234,345])
      PivotalToPdfApp.start(["story", 123, 234, 345])
    end
    it "should call story with one id" do
      PivotalToPdf::Main.should_receive(:story).with([123])
      PivotalToPdfApp.start(["story", 123])
    end
    it "should not call story when no story id is given" do
      PivotalToPdf::Main.should_not_receive(:story)
      PivotalToPdfApp.start(["story"])
    end
  end
  context "when passed in label sub command" do
    it "should call label" do
      PivotalToPdf::Main.should_receive(:label).with("sometext")
      PivotalToPdfApp.start(["label", "sometext"])
    end
    it "should not call label when no label text is given" do
      PivotalToPdf::Main.should_not_receive(:label)
      PivotalToPdfApp.start(["label"])
    end
  end
  context "when passed in current_iteration sub command" do
    it "should call current_iteration" do
      PivotalToPdf::Main.should_receive(:current_iteration)
      PivotalToPdfApp.start(["current_iteration"])
    end
  end
  context "when passed in iteration sub command" do
    it "should call iteration" do
      PivotalToPdf::Main.should_receive(:iteration).with("1")
      PivotalToPdfApp.start(["iteration", "1"])
    end

    context "when no iteration number specified" do
      it "should not call iteration" do
        PivotalToPdf::Main.should_not_receive(:iteration)
        PivotalToPdfApp.start(["iteration"])
      end
    end
  end
end
