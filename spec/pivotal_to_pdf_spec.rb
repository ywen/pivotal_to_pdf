require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

module PivotalToPdf
  describe Main do
    let(:writer) {double :writer, :write_to => true}
    before(:each) do
      FormatterFactory.stub(:formatter).and_return Formatters::Default
    end
    
    shared_examples "formatter fetching" do
      it "asks the FormatterFactory for the formatter" do
        FormatterFactory.should_receive(:formatter).and_return Formatters::Default
        method.call
      end
    end
    describe ".story" do
      let(:story) {double :story}
      let(:method) { lambda{ Main.story 32 } }
      before(:each) do
        Story.stub(:find).and_return story
        Formatters::Default.stub(:new).and_return writer
      end

      include_examples "formatter fetching"
      
      it "initiates a story" do
        Story.should_receive(:find).with(23).and_return story
        Main.story 23
      end

      it "build a pdf writer" do
        Formatters::Default.should_receive(:new).with([ story ]).and_return writer
        Main.story 23
      end

      it "asks the pdf writer to print it" do
        writer.should_receive :write_to
        Main.story 23
      end
    end
    describe ".current_iteration" do
      let(:stories) {double :stories_from_iteration}
      let(:iteration) {double :iteration, :stories => stories}
      let(:method) { lambda{ Main.current_iteration } }
      before(:each) do
        Iteration.stub(:find).and_return [iteration, double]
        Formatters::Default.stub(:new).and_return writer
      end
      include_examples "formatter fetching"
      
      it "initiates an Iteration" do
        Iteration.should_receive(:find).with(:all, :params => {:group => "current"}).and_return [iteration]
        Main.current_iteration
      end

      it "build a pdf writer" do
        Formatters::Default.should_receive(:new).with(stories).and_return writer
        Main.current_iteration
      end

      it "asks the pdf writer to print it" do
        writer.should_receive :write_to
        Main.current_iteration
      end
    end

    describe ".iteration" do
      let(:stories) {double :stories_from_iteration}
      let(:iteration) {double :iteration, :stories => stories}
      let(:method) { lambda{ Main.iteration 13 } }
      before(:each) do
        Iteration.stub(:find).and_return [iteration, double]
        Formatters::Default.stub(:new).and_return writer
      end

      include_examples "formatter fetching"

      it "fetches an Iteration, given the Iteration number (you have to minus to get the accurate iteration)" do
        Iteration.should_receive(:find).with(:all, :params => {:offset => 12, :limit => 1}).and_return [iteration]
        Main.iteration 13
      end

      it "build a pdf writer" do
        Formatters::Default.should_receive(:new).with(stories).and_return writer
        Main.iteration 13
      end

      it "asks the pdf writer to print it" do
        writer.should_receive :write_to
        Main.iteration 13
      end
    end

    describe ".label" do
      let(:story) {double :story}
      let(:method) { lambda{ Main.label "testing" } }
      before(:each) do
        Story.stub(:find).and_return story
        Formatters::Default.stub(:new).and_return writer
      end
      include_examples "formatter fetching"
      
      it "initiates a label search" do
        # Kind of a null test here, not sure how else to spec it
        Story.should_receive(:find).with(:all, {:params=>{:filter=>"label:\"testing\""}}).and_return story
        Main.label "testing"
      end

      it "build a pdf writer" do
        Formatters::Default.should_receive(:new).with(story).and_return writer
        Main.label "testing"
      end

      it "asks the pdf writer to print it" do
        writer.should_receive :write_to
        Main.label "testing"
      end
    end
  end
end
