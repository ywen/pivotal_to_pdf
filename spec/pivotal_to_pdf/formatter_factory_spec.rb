require 'spec_helper'

module PivotalToPdf
  describe FormatterFactory do
    describe ".current_formatter" do
      before(:each) do
        Configure.stub(:new).and_return config
      end

      let(:config) { double :config }
      
      context "when the formatter is not defined" do
        it "returns the default formatter" do
          FormatterFactory.formatter.should eq(PivotalToPdf::Formatters::Default)
        end
      end
      
      context "formatter is configured as a path to a ruby file" do
        let(:config) { 
          double :config, :formatter => File.join(File.dirname(__FILE__), *%w{.. fixtures custom_formatter.rb}) 
        }

        it "loads the file and returns the formatter with the same name" do
          FormatterFactory.formatter.should eq(CustomFormatter)
        end
      end

      context "formatter is configured as a class name" do
        let(:config) { double :config, :formatter => "PivotalToPdf::AClass" }

        it "returns the specified formatter" do
          PivotalToPdf::AClass = Class.new
          FormatterFactory.formatter.should eq(PivotalToPdf::AClass)
        end
      end
    end
  end
end
