require 'spec_helper'

module PivotalToPdf
  describe FormatterFactory do
    describe ".current_formatter" do
      before(:each) do
        Configure.stub(:new).and_return config
      end
      
      context "when the format_class is not defined" do
        let(:config) { double :config }
        it "returns the default formatter" do
          FormatterFactory.formatter.should eq(PivotalToPdf::DefaultFormatter)
        end
      end
      
      context "when the format_class is defined" do
        let(:config) { double :config, :formatter => "PivotalToPdf::AClass" }
        before(:each) do
          PivotalToPdf::AClass = Class.new
        end
        
        it "returns the default formatter" do
          FormatterFactory.formatter.should eq(PivotalToPdf::AClass)
        end
      end
    end
  end
end
