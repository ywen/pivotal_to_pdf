require 'rubygems'
require 'rainbow'
require 'active_resource'
require 'pivotal_to_pdf/story'
require 'pivotal_to_pdf/pdf_writer'
class PivotalToPdf
  class << self
    def write(story_id)
      story = Story.find(story_id)
      PdfWriter.new(story).write_to
    end
  end
end
