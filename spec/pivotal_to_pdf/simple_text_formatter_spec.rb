require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module PivotalToPdf
  describe SimpleTextFormatter do
    describe "#output" do
      let(:formatter) {SimpleTextFormatter.new "a text"}
      context "when there is no special formatting" do
        it "should return the string" do
          expect(formatter.output).to eq("a text")
        end
      end
      context "when there is bold special formatting" do
	let(:formatter) {SimpleTextFormatter.new "a *special test* text"}
        it "should return the string converted" do
          expect(formatter.output).to eq("a <b>special test</b> text")
        end
      end
      context "when there is italic special formatting" do
        let(:formatter) {SimpleTextFormatter.new "a _special test_ text"}
        it "should return the string converted" do
          expect(formatter.output).to eq("a <i>special test</i> text")
        end
      end
      context "when the text to format is nil" do
        let(:formatter) {SimpleTextFormatter.new nil}
        it "should convert to an empty string" do
          expect(formatter.output).to be_empty
        end
      end
    end
  end
end
