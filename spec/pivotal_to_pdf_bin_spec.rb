require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
load File.expand_path(File.join(File.dirname(__FILE__), "..", "bin", "pivotal_to_pdf"))

describe 'PivotalToPdf Bin' do
  describe "when pased in story sub command" do
    it "should call story" do
      PivotalToPdf.should_receive(:story).with(123, nil)
      PivotalToPdfApp.start(["story", 123])
    end
    it "should not call story when no story id is given" do
      PivotalToPdf.should_not_receive(:story)
      PivotalToPdfApp.start(["story"])
    end

    describe "and when the nocolor option is defined" do
      it "should pass the option in" do
        PivotalToPdf.should_receive(:story).with(123, "nocolor")
        PivotalToPdfApp.start(["story", 123, "--nocolor"])
      end
    end
  end
  describe "when pased in iteration sub command" do
    it "should call iteration" do
      PivotalToPdf.should_receive(:iteration).with(123, nil)
      PivotalToPdfApp.start(["iteration", 123])
    end

    describe "and when the nocolor option is defined" do
      it "should pass the option in" do
        PivotalToPdf.should_receive(:iteration).with(123, "nocolor")
        PivotalToPdfApp.start(["iteration", 123, "--nocolor"])
      end
    end
  end
end

