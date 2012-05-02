module PivotalToPdf
  module FormatterFactory
    class << self
      def formatter
        config = Configure.new
        if config.respond_to?(:formatter)
          if File.exist?(config.formatter)
            load config.formatter
            formatter_class_name = camelize(File.basename(config.formatter, '.rb'))
          else
            formatter_class_name = config.formatter
          end
          formatter_class_name.constantize
        else
          PivotalToPdf::Formatters::Default
        end
      end

      def camelize(str)
        str.split('_').map {|w| w.capitalize}.join
      end
    end
  end
end
