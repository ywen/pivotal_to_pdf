require 'spec_helper'

module PivotalToPdf
  describe Text do
    subject { Text.new "text" }

    describe ".formatting_classes" do
      it "returns formatting classes" do
        expect(Text.formatting_classes).to eq(
          [ TextFormatters::SimpleMarkup ]
        )
      end
    end

    describe "#==" do
      context "when another text's string matches" do
        it "is equal to the other" do
          expect(subject).to eq(Text.new("text"))
        end
      end

      context "when another text's string doesn't " do
        it "is not equal to the other" do
          expect(subject).not_to eq(Text.new("text2"))
        end
      end
    end

    describe "#hash" do
      it "returns strig's hash value" do
        expect(subject.hash).to eq("text".hash)
      end
    end

    describe "#to_s" do
      let(:formatter1) { double :formatter1, :output => "text2"}
      let(:formatter2) { double :formatter2, :output => "text3"}
      let(:klass1) { double :format_class1, :new => formatter1 }
      let(:klass2) { double :format_class2, :new => formatter2 }

      before(:each) do
        Text.stub(:formatting_classes).and_return [klass1, klass2]
      end
      
      it "asks each formatting class's output in order" do
        klass1.should_receive(:new).with("text").and_return formatter1
        klass2.should_receive(:new).with("text2").and_return formatter2
        expect(subject.to_s).to eq("text3")
      end
    end
  end
end
