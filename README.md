# Thesis Template for Temple University

A simple and customizable PhD dissertation and Masters thesis LaTeX template built originally for Temple University students.

## Why?

There are numerous similar templates out there for various other schools. However, they are all very customized and very school specific. One thing that I do specifically like about Temple University's template is that it is very plain and generic and easily reusable in other contexts. The mathematics department even provides a base [LaTeX template](https://math.temple.edu/~it/tuthesis/)! However, that version does not appear to be actively maintained, is internally inconsistent, and out of date with the current [handbook](https://grad.temple.edu/resources/dissertation-thesis-handbook). There are a few other repos out there that have attempted to tackle this, but they too are actually out of date and unmaintained with the current style guide.
On top of that, the other examples I've found for specific TU implementations have been far too author, school, or department specific and would be cumbersome to adapt.

## Goals

The goals of this project are simple:

1. Provide a truly generic implementation of a LaTeX document template that can be used either for a Master's thesis or Ph.D. dissertation across any department or college within Temple
2. Optionally, at any other university as well, provided they follow Temple's style guide or something similar. Failing that, this should serve as an easily adaptable template class that can be forked.

## Features

- Simple and clean `LaTeX` template allowing specification of the degree type, department, college, and university
- Automatic formating of the committee members and their roles through the `\advisor` and `\committeemember` commands
- Automatic generation of the title page, abstract, acknowledgements, and table of contents, list of figures, and list of tables
- Automatic formatting of the bibliography and citations using BibTeX

## Usage

1. Install your favorite `LaTeX` distribution. I recommend [TeX Live](https://www.tug.org/texlive/) as that is what I use and this was built against. Its a behomoth, but it has everything you need.
2. Clone this repository or download the ZIP file and extract it to a directory of your choice.
3. Open `tu_thesis.tex` in your favorite LaTeX editor and start writing your thesis or dissertation!

## Alternative Usage

Another advantage of using LaTeX over WISWIG text editors (e.g. Word) is that plain text is easily version controlled. This means you can use Git to track changes to your document over time. This is especially useful for large documents like theses and dissertations, where you may want to revert to a previous version or see how your document has changed over time. It also allows for updated to the formating (e.g. the `.cls` file) to be seperately modified and updated without having to worry about breaking the document itself.

To use in this manner I suggest the following:

1. Fork this repository to your own GitHub account
2. Clone the repository to your local machine
3. Create a new branch for your changes

The fork should still permit you to pull in upstream changes from the original repository. This way you can keep your fork up to date with the latest changes and improvements to the template.