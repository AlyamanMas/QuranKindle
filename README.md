# Overview
This is a compilation/PDF of the Holy Qur'an for the Kindle Paperwhite
11th Gen. It's designed to fit the screen size of the device and thus
waste as little space as possible.

It was made using [Typst](https://typst.app) with the Qur'an pages
from [Kind Fahd Glorious Quran Printing Complex](https://dm.qurancomplex.gov.sa/en/)
and some data from the Quran.com Android app's source code.

# Features
- Uses the Madani Mushaf of 1441
- Has an outline that can be accessed from the device's top bar
  for easy access to Surahs
- Includes a table of contents at the end
- Page numbers in the PDF correspond directly to page numbers in the 
  Mushaf, making it easy to navigate directly to a specific page 
  through the device's page navigation feature

# Compiling
You can adapt the project to any device by modifying the page 
dimensions in the `template.typ` file and then compiling the project 
with `typst compile`. You will need to have the Amiri font installed.
Additionally, you will need to have the Qur'an pages inside the 
`cropped` directory with a specific naming convention found inside 
`main.typ`. The attached `main.pdf` uses the Hafs Narration files
cropped with Inkscape[^1] to remove the unnecessary decorations and padding

[^1]: This is done with the following commands:
  `for file in 1441/*.ai; do inkscape "$file" -i layer-MC3 -o "cropped/$(basename $file).svg"; done`
