module PivotalToPdf
  class SimpleTextFormatter
    attr_reader :string
    private :string
    def initialize(string)
      @string = string
    end

    def output
      string.gsub( /\*(.*)\*/,"<b>\\1</b>").gsub(/_(.*)_/, "<i>\\1</i>")
    end
  end
end
