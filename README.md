# Thesis Template for Temple University

A simple and customizable PhD dissertation and Masters thesis LaTeX template built originally for Temple University students.

## Why?

There are numerous similar templates out there for various other schools. However, they are all very customized and very school specific. One thing that I do specifically like about Temple University's template is that it is very plain and generic and easily reusable in other contexts. The mathematics department even provides a base [LaTeX template](https://math.temple.edu/~it/tuthesis/)! However, that version does not appear to be actively maintained, is internally inconsistent, and out of date with the current [handbook](https://grad.temple.edu/resources/dissertation-thesis-handbook). There are a few other repos out there that have attempted to tackle this, but they too are actually out of date and unmaintained with the current style guide.
On top of that, the other examples I've found for specific TU implementations have been far too author, school, or department specific and would be cumbersome to adapt.

## Goals

The goals of this project are simple:

1. Provide a truly generic implementation of a $\latex$ document template that can be used either for a Master's thesis or Ph.D. dissertation across any department or college within Temple
2. Optionally, at any other university as well, provided they follow Temple's style guide or something similar. Failing that, this should serve as an easily adaptable template class that can be forked.

## Features

- Simple and clean LaTeX template allowing specification of the degree type, department, college, and university
- Automatic formating of the committee members and their roles through the `\advisor` and `\committeemember` commands
- Automatic generation of the title page, abstract, acknowledgements, and table of contents, list of figures, and list of tables
- Automatic formatting of the bibliography and citations using BibTeX
  