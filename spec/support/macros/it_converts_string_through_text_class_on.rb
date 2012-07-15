module Macros
  def it_converts_string_through_text_class_on(*fields)
    fields.each do |field|
      describe "#formatted_#{field}" do
        let(:text) { double :text, :to_s => "formatedd #{field}"}
        before(:each) do
          PivotalToPdf::Text.stub(:new).and_return text
        end
        
        it "sends the string to Text class" do
          PivotalToPdf::Text.should_receive(:new).with(subject.send(field)).and_return text
          subject.send("formatted_#{field}")
        end

        it "returns Text.to_s" do
          text.should_receive(:to_s).and_return "formatted #{field}"
          expect(subject.send("formatted_#{field}")).to eq("formatted #{field}")
        end
      end
    end
  end
end
