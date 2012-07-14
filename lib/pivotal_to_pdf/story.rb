module PivotalToPdf
  class Story < Pivotal
    def formatted_labels
      return "" if !self.respond_to?(:labels) || self.labels.nil? || self.labels.empty?
      formatted_output :labels
    end

    def points
      return nil unless self.feature?
      "Points: " + (self.respond_to?(:estimate) && !self.estimate.eql?(-1) ? self.estimate.to_s : "Not yet estimated")
    end

    def story_color
      return "52D017" if feature?
      return "FF0000" if bug?
      return "FFFF00" if chore?
      return "000000" # For Releases or Unknown type
    end

    def formatted_name
      formatted_output :name
    end

    def formatted_description
      formatted_output :description
    end

    private

    def formatted_output(field)
      Text.new(send(field)).to_s
    end

    ["feature", "bug", "chore", "release"].each do |type_str|
      class_eval <<-EOS
      def #{type_str}?
      self.story_type == "#{type_str}"
    end
      EOS
    end
  end
end
