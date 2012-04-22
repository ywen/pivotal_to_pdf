require 'rubygems'
require "pivotal_to_pdf/version"
require 'rainbow'
require 'thor'
require 'active_resource'
require 'pivotal_to_pdf/configure'
require 'pivotal_to_pdf/simple_text_formatter'
require 'pivotal_to_pdf/pivotal'
require 'pivotal_to_pdf/iteration'
require 'pivotal_to_pdf/story'
require 'pivotal_to_pdf/default_formatter'
require 'pivotal_to_pdf/pt-workarounds'

module PivotalToPdf
  class Main < Thor
    class << self
      def story(story_id)
        story = Story.find(story_id)
        DefaultFormatter.new([ story ]).write_to(story_id)
      end

      def current_iteration
        iteration = Iteration.find(:all, :params => {:group => "current"}).first
        DefaultFormatter.new(iteration.stories).write_to("current")
      end

      def iteration(iteration_number)
        iteration = Iteration.find(:all, :params => {:offset => iteration_number.to_i - 1, :limit => 1}).first
        DefaultFormatter.new(iteration.stories).write_to(iteration_number)
      end

      def label(label_text)
        stories = Story.find(:all, :params => {:filter => "label:\"" + label_text + "\""})
        DefaultFormatter.new(stories).write_to(label_text)
      end
    end
  end
end
