#!/usr/bin/env ruby

# Script to generate PDF cards suitable for planning poker
# from Pivotal Tracker [http://www.pivotaltracker.com/] CSV export.

# Inspired by Bryan Helmkamp's http://github.com/brynary/features2cards/

# Example output: http://img.skitch.com/20100522-d1kkhfu6yub7gpye97ikfuubi2.png

require 'rubygems'
require 'prawn'
require 'rainbow'

class PdfWriter
  attr_reader :card
  def initialize(card)
    @card = card
  end

  def write_to
    Prawn::Document.generate("#{card.id}.pdf",
                             :page_layout => :landscape,
                             :margin      => [25, 25, 50, 25],
                             :page_size   => [302, 432]) do |pdf|

      pdf.font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      # pdf.start_new_page
      padding = 12
      pdf.stroke_color = "666666"
      pdf.stroke_bounds
      width = 370
      # --- Write content
      pdf.bounding_box [pdf.bounds.left+padding, pdf.bounds.top-padding], :width => width do
        pdf.text card.name, :size => 14
        pdf.text "\n", :size => 14
        pdf.fill_color "444444"
        pdf.text card.description || "", :size => 10
        pdf.fill_color "000000"
      end

      pdf.text_box "Points: " + card.estimate.to_s,
        :size => 12, :at => [12, 50], :width => width-18
      pdf.text_box "Owner: " + card.owned_by,
        :size => 8, :at => [12, 18], :width => width-18

      pdf.fill_color "999999"
      pdf.text_box card.story_type.capitalize,  :size => 8,  :align => :right, :at => [12, 18], :width => width-18
      pdf.fill_color "000000"


      # --- Footer
      pdf.number_pages "Story ID: #{card.id}", [pdf.bounds.left,  -28]

      puts ">>> Generated PDF file in '#{card.id}.pdf'".foreground(:green)
  end
  rescue Exception
    puts "[!] There was an error while generating the PDF file... What happened was:".foreground(:red)
    raise
  end
end
