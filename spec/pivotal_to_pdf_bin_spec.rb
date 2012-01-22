require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
load File.expand_path(File.join(File.dirname(__FILE__), "..", "bin", "pivotal_to_pdf"))

describe 'PivotalToPdf Bin' do
  context "when pased in story sub command" do
    it "should call story" do
      PivotalToPdf::Main.should_receive(:story).with(123)
      PivotalToPdfApp.start(["story", 123])
    end
    it "should not call story when no story id is given" do
      PivotalToPdf::Main.should_not_receive(:story)
      PivotalToPdfApp.start(["story"])
    end
  end
  context "when pased in current_iteration sub command" do
    it "should call current_iteration" do
      PivotalToPdf::Main.should_receive(:current_iteration)
      PivotalToPdfApp.start(["current_iteration"])
    end
  end
end

