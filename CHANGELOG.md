v1.3.3
  * Internal refactoring.
  * BREAKING CHANGE: ```Story#label_text``` is renamed to ```Story#formatted_labels```

v1.1.0
  * Add label command for printing stories matching any given label

v1.0.0
  * Rename iteration command to current_iteration command
  * Add iteration command for printing any given iterations

v0.9.1
  * A bug fix where a nil description or name field will break the PDF generation

v0.9
  * Added printing support for bold and italic fonts
  * removed page number. Did not find it really useful

v0.8.2
  * Used activeresource 3.0.9. 3.1.0 broke the pivotal API, it seems

v0.8 
  * Fixed an issue where the gem didn't handle the releases

v0.7.1
  * To support prawn 0.11.1
	* To make the border thicker

v0.6
 * The points section will be printed only for features. Bugs and Chores don't
 have points
 * Printed a green bounding box for feature, a yellow box for chores and a red
 box for bugs

v0.5.2.1 Fixed a manifest problem

v0.5.2 Printed labels to the cards

v0.5.1 minor improvement over printing estimate, owned by

v0.5 be able to print out an iteration into one single PDF file

v0.1.1 added a homepage

v0.1 initial setup