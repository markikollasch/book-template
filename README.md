# Book Template

This is a lightweight template for organizing and publishing long-form composition.
It depends only on [Pandoc](http://pandoc.org/) and standard Unix utilities.

Write text in your own favorite editor, using any file structure you wish,
and output the result into any format supported by Pandoc.

Clone or fork this repository and edit the files directly to customize it.
Delete the text in the existing source files
(which are preserved solely to demonstrate the template's behavior)
and replace it with your own work.
Use git to keep a revision history of the text.

It has not been tested on mutliple systems, but it should run on OSX and Linux.
Running it under Windows is left as an exercise for the adventuresome reader.

## Getting Started

Near the top of the `Makefile` is a place to put what you want the filename of your book to be.
We recommend using `lower-snake-case` for this, e.g. `wuthering-heights`.
Don't add a file extension; that will be added automatically.
The output process can be configured in this file as well, as described in its comments.

In the `src` directory, edit the file `metadata.yml` with the book's title and your name.
This is a [Pandoc metadata block](http://pandoc.org/MANUAL.html#metadata-blocks),
so other data can be put in there as well.

All of the files in `src` that end with the extension `.md` will be compiled into the final text.
They'll be added in alphabetical order.
To keep your text in order, it is recommended to prefix all of the files with numbers.
Other files will be excluded unless the build process includes them specifically.

A common way to structure the text is to put each chapter in one file,
but this is not enforced.
You could write one scene per file, or put the whole book in a single file
(although this would make the entire template somewhat useless).
Every top-level header, regardless of where it's written, adds a new chapter.
This matters because the table of contents will be generated from them.

Run the command `make` to generate the complete output of your text.
These fully standalone files will appear in a directory called `dist`.
Give them to your friends and victims.
You can also build just one output format by specifying the format, e.g. `make pdf`.
The command `make clean` will delete your output files, in case you wanted to do that.

It is preconfigured to output in `html`, `pdf`, and `epub` formats,
but you can add others such as `docx` by editing the Makefile.

Once you've gotten the hang of using this template, or even sooner,
replace the contents of this README with a description of your book.
Because this is a git repository,
you can always recover these instructions from the history.

## What's in the template

- `README.md`:
This file.
Note that, like everything else in the top-level directory,
it won't go into the finished book.
- `LICENSE.md`:
An assertion that this template is released under
[Creative Commons Zero](https://wiki.creativecommons.org/wiki/CC0).
You should delete this file,
or replace it with one that describes the copyright status of your book.
- `Makefile`:
Where the magic happens.
Recipes for generating the output files.
You can hack on that file to customize its behavior,
such as by adding options unique to a specific output format,
adding or deleting new formats,
changing the input format,
anything you want, really.
-`src/`:
The source directory.
All of the files needed to assemble your book should live there.
Other files (like notes) should be put somewhere else.
Markdown files in this directory will be automatically included.
Non-Markdown files will need to be included explicitly by editing the `Makefile`.
-`src/000-chapter-1.md`, `src/001-writing-style.md`, and `050-and-another-thing.md`:
A self-describing example of how you might structure your text.
-`src/metadata.yml`:
The place to put information about your book.
The title, author, etc. will be inserted into the book from this file,
so there's no need to put them explicitly in the Markdown.
-`src/style.css`:
If you intend to publish in `html` format,
this file will describe the styles of the finished page.
It will be embedded directly into the output file,
so you will still have only a single file to distribute.
It is also included as an example of how to customize individual output formats.
If you don't need HTML output, go ahead and delete it.
