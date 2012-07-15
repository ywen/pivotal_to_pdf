require "spec_helper"

module PivotalToPdf
  describe Configure do
    describe ".new" do
      let(:configurations) do
        {
          :project_id => "1233",
          :token => "aaaaa",
          :formatter => "PivotalToPdf::SomethingCrazy",
          :something_else => "some other my own configs" 
        }
      end
      before(:each) do
        YAML.stub(:load_file).and_return configurations
      end
      
      context "when the environment var PIVOTAL_TO_PDF_CONFIG_DIR is defined" do
        before(:each) { ENV["PIVOTAL_TO_PDF_CONFIG_DIR"] = "/a/dir" }
        after(:each) { ENV["PIVOTAL_TO_PDF_CONFIG_DIR"] = nil }
        it "loads the file from the position" do
          YAML.should_receive(:load_file).with("/a/dir/.pivotal.yml")
          Configure.new
        end
      end
      context "when the environment var PIVOTAL_TO_PDF_CONFIG_DIR is not defined" do
        before(:each) { ENV["PIVOTAL_TO_PDF_CONFIG_DIR"] = nil }
        it "loads the file from the HOME" do
          YAML.should_receive(:load_file).with(File.expand_path("~/.pivotal.yml"))
          Configure.new
        end
      end
      context "defines methods for each key loaded from the config yaml file" do
        {
          :project_id => "1233",
          :token => "aaaaa",
          :formatter => "PivotalToPdf::SomethingCrazy",
          :something_else => "some other my own configs" 
        }.each do |key, value|
          it "defines #{key} as a method and returns the value: #{value}" do
            expect(subject.send(key)).to eq(value)
          end
        end
      end

    end
  end
end

