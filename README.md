pivotal_to_pdf -- print the stories from pivotal tracker to a PDF file
====================================

## DESCRIPTION
This is a gem that can read a story from pivotal tracker and print into a 4x6 card so that you can print the card and stick to your physical story board.

I steal the part of code from http://ephemera.karmi.cz/post/622136360/create-printable-pdf-cards-for-your-pivotal-tracker-stor The difference is the code there print to a A4 paper with 4 stories on it. This gem prints one card at a time and the gem doesn't require an exported csv file.
 
## INSTALL
  $ [sudo] gem install pivotal_to_pdf

## USAGE
First you need to create a .pivotal.yml under your home directory. On windows, have this file in %HOME%.pivotal.yml

a sample .pivotal.yml:

    token: your-api-token-of-pivotal-tracker
    project_id: your-ptroject-id

After install the gem, you can do:

* pivotal_to_pdf iteration       # print stories for the current iteration into a PDF file
* pivotal_to_pdf story STORY_ID  # print a single story specifed by ID into a PDF file


The gem will then read the story/stories and print it into a PDF file

The gem assumes that you have https access to the pivotal tracker

##Contributors
 Yi Wen, Carol Nichols
