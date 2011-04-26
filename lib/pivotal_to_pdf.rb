require 'rubygems'
require 'rainbow'
require 'thor'
require 'active_resource'
require 'pivotal_to_pdf/pivotal'
require 'pivotal_to_pdf/iteration'
require 'pivotal_to_pdf/story'
require 'pivotal_to_pdf/pdf_writer'
class PivotalToPdf < Thor
  class << self
    def story(story_id, colored_stripe=true)
      story = Story.find(story_id)
      PdfWriter.new(story, colored_stripe).write_to
    end

    def iteration(iteration_token, colored_stripe=true)
      iteration = Iteration.find(:all, :params => {:group => iteration_token}).first
      PdfWriter.new(iteration, colored_stripe).write_to
    end
  end
end
