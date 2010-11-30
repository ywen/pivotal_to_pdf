require 'optparse'

class CommandLineReader
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

    opts.on("-s", "--story story-id", "Print put one story") do |story|
      options[:story] = story
    end
  end.parse!
  p options
  PivotalToPdf.write ARGV[0]

end
