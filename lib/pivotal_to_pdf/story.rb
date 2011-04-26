class Story < Pivotal
  def label_text
    return "" if !self.respond_to?(:labels) || self.labels.nil? || self.labels.empty?
    labels
  end

  def points
    return nil if self.story_type != "feature"
    "Points: " + (self.respond_to?(:estimate) && !self.estimate.eql?(-1) ? self.estimate.to_s : "Not yet estimated")
  end
end
