require 'echoe'
require File.expand_path(File.dirname(__FILE__))+'/tasks/spec'
Echoe.new('pivotal_to_pdf') do |p|
  p.description    = "Convert Pivotal Tracker Stories to 4x6 PDF for printing so that you can stick the card to your story board"
  p.summary = "Convert Pivotal Tracker Stories to 4x6 PDF for printing"
  p.author         = "Yi Wen"
  p.email          = "hayafirst@gmail.com"
  p.runtime_dependencies = [ 'activeresource', 'prawn 0.11.1', 'rainbow', 'thor' ]
  p.bin_files = [ "bin/pivotal_to_pdf" ]
  p.url = "https://github.com/ywen/pivotal_to_pdf"
  # p.ignore_pattern = ["bin/*"]
  # p.development_dependencies = []
end
