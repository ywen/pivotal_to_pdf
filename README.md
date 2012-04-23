pivotal_to_pdf -- print the stories from pivotal tracker to a PDF file
====================================

[![Build Status](https://secure.travis-ci.org/ywen/pivotal_to_pdf.png)](http://travis-ci.org/ywen/pivotal_to_pdf)

## DESCRIPTION
This is a gem that can read a story from pivotal tracker and print into a 4x6 card so that you can print the card and stick to your physical story board.

I steal the part of code from http://ephemera.karmi.cz/post/622136360/create-printable-pdf-cards-for-your-pivotal-tracker-stor The difference is the code there print to a A4 paper with 4 stories on it. This gem prints one card at a time and the gem doesn't require an exported csv file.
 
## INSTALL
  $ [sudo] gem install pivotal_to_pdf

## USAGE
First you need to create a .pivotal.yml under your home directory. On windows, have this file in %HOME%.pivotal.yml

a sample .pivotal.yml:

```yaml
token: your-api-token-of-pivotal-tracker
project_id: your-ptroject-id
formatter: PivotalToPdf::DefaultFormatter
```

The meaning of the ```formatter``` key will be explained in the next section

After install the gem, you can do:

* pivotal_to_pdf current_iteration       # print stories for the current iteration into a PDF file

* pivotal_to_pdf story STORY_ID  # print a single story specifed by ID into a PDF file

* pivotal_to_pdf iteration ITERATION_NUMBER # print a single iteration specifed by the number into a PDF file

* pivotal_to_pdf label LABEL_TEXT # print stories matching the specified label into a PDF file

Examples:

```bash

pivotal_to_pdf story 159898

pivotal_to_pdf current_iteration

pivotal_to_pdf iteration 42

pivotal_to_pdf label print-these
```

Type in

```bash
pivotal_to_pdf help

pivotal_to_pdf help <command>
```

for more usage information

The gem will then read the story/stories and print it into a PDF file

The points section will be printed only for features. Bugs and Chores don't have points

Printed a green bounding box for feature, a yellow box for chores and a red box for bugs

The gem assumes that you have https access to the pivotal tracker

## Formatters

From the version 1.2, The gem supports alternative formatter other than the default one.
In the ```.pivotal.yml``` file, if you define a key like

```yaml

formatter: PivotalToPdf::MyPrettyHtmlWriter
```

The gem will use ```PivotalToPdf::Formatters::MyPrettyHtmlWriter``` to generate the output.

This feature is associated to the [issue #14](pivotal_to_pdf/issues/14). I basically rewrite the code to implement this myself.

The actual formatters live in a [ seperate gem ](https://github.com/ywen/pivotal_to_pdf-formatters) so that only that gem needs to be updated when needed. Once that gem is updated, you can do:

```bash
$ gem update pivotal_to_pdf-formatters
```

to use the new formatters being added

##Contributors
* [Yi Wen](https://github.com/ywen)
* Carol Nichols
* Kristian Rasmussen 
* [Alastair Mair](https://github.com/amair)
* [John-Mason P. Shackelford](https://github.com/jpshackelford)
* [Bret Mogilefsky](https://github.com/mogul)
