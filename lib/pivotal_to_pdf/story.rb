class Story < Pivotal
  def label_text
    return "" if !self.respond_to?(:labels) || self.labels.nil? || self.labels.empty?
    labels
  end
end
