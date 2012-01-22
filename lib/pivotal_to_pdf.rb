require 'rubygems'
require 'rainbow'
require 'thor'
require 'active_resource'
require 'pivotal_to_pdf/simple_text_formatter'
require 'pivotal_to_pdf/pivotal'
require 'pivotal_to_pdf/iteration'
require 'pivotal_to_pdf/story'
require 'pivotal_to_pdf/pdf_writer'
module PivotalToPdf
  class Main < Thor
    class << self
      def story(story_id)
        story = Story.find(story_id)
        PivotalToPdf::PdfWriter.new(story).write_to
      end

      def current_iteration
        iteration = Iteration.find(:all, :params => {:group => "current"}).first
        PivotalToPdf::PdfWriter.new(iteration).write_to
      end

      def iteration(iteration_number)
        iteration = Iteration.find(:all, :params => {:offset => iteration_number.to_i, :limit => 1}).first
        PivotalToPdf::PdfWriter.new(iteration).write_to
      end
    end
  end
end
