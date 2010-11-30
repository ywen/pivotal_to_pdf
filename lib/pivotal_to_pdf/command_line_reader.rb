require 'optparse'

class CommandLineReader
  def options(*args)
    options = {}
    OptionParser.new do |opts|
      opts.banner = "pivotal_to_pdf [options]"

      opts.on("-s", "--story story-id", "Print one story specified by the story-id") do |story|
        options[:story] = story
      end
    end.parse!(args)
    p options
    # PivotalToPdf.write ARGV[0]
  end
end
