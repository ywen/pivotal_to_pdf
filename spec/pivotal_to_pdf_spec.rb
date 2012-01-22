require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

module PivotalToPdf
  describe Main do
    describe ".story" do
      let(:story) {double :story}
      let(:writer) {double :writer, :write_to => true}
      before(:each) do
        Story.stub(:find).and_return story
        PivotalToPdf::PdfWriter.stub(:new).and_return writer
      end
      
      it "initiates a story" do
        Story.should_receive(:find).with(23).and_return story
        Main.story 23
      end

      it "build a pdf writer" do
        PivotalToPdf::PdfWriter.should_receive(:new).with(story).and_return writer
        Main.story 23
      end

      it "asks the pdf writer to print it" do
        writer.should_receive :write_to
        Main.story 23
      end
    end
  end
end
