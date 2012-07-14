module PivotalToPdf
  class Text
    class << self
      def formatting_classes
        [ SimpleTextFormatter ]
      end
    end

    attr_reader :string
    protected :string

    def initialize(string)
      @string = string
    end

    def ==(other)
      string == other.string
    end

    def hash
      string.hash
    end

    def to_s
      output = string
      self.class.formatting_classes.each do |klass|
        output = klass.new(output).output
      end
      output
    end
  end

end

