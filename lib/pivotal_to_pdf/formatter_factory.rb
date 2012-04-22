module PivotalToPdf
  module FormatterFactory
    class << self
      def formatter
        config = Configure.new
        config.respond_to?(:formatter) ? 
          config.formatter.constantize :
          PivotalToPdf::DefaultFormatter
      end
    end
  end
end
