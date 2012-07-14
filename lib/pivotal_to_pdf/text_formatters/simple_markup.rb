module PivotalToPdf
  module TextFormatters
    class SimpleMarkup
      attr_reader :string
      private :string
      def initialize(string)
        @string = string.to_s
      end

      def output
        string.gsub( /\*(.*)\*/,"<b>\\1</b>").gsub(/_(.*)_/, "<i>\\1</i>")
      end
    end
  end
end
