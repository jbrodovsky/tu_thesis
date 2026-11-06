%% thesis-dissertation.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-dissertation}[2025/01/17 Template for Theses and Dissertations]

%% Base class setup
\LoadClass[12pt]{report} % Report provides things like \abstract

%% Packages
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage{titlecaps}
\RequirePackage{titlesec}
%% Title case settings
\Addlcwords{a an the as at an by for in of off on per to up via and as but for if nor or so yet be am is are was}

%% Geometry and Margins
\geometry{
  left=1.5in,
  right=1in,
  top=1in,
  bottom=1in
}

%% Line spacing
\setstretch{2}

%% Title and Document Information
\newcommand{\mydegree}{\relax}
\newcommand{\mydoctype}{\relax}
\newcommand{\myuniversity}{\relax}
\newcommand{\myschool}{\relax}
\newcommand{\mydepartment}{\relax}
\newcommand{\myorg}{\relax}
\newcommand{\myadvisor}{\relax}
\newcommand{\mycommitteemembers}{\relax}
\newcommand{\mycopyrightyear}{}
\newcommand{\copyrightyear}[1]{\renewcommand{\mycopyrightyear}{#1}}

\newcommand{\degree}[1]{\renewcommand{\mydegree}{#1}}
    %\g@addto@macro\mydegree{#1}}
\newcommand{\doctype}[1]{\renewcommand{\mydoctype}{#1}}
\newcommand{\advisor}[2]{
    \g@addto@macro\myadvisor{#1, Advisory Chair, #2\\}}
\newcommand{\committeemember}[2]{%
  \g@addto@macro\mycommitteemembers{#1, #2\\}}
\newcommand{\university}[1]{\renewcommand{\myuniversity}{#1}}
\newcommand{\school}[1]{\renewcommand{\myschool}{#1}}
\newcommand{\department}[1]{\renewcommand{\mydepartment}{#1}}
\newcommand{\graduateorg}[1]{\renewcommand{\myorg}{#1}}

%% Title Page Command
% Spacing matches the Graduate School's title page template
\newlength{\tp@titlewidth} \setlength{\tp@titlewidth}{4.9in}
\newlength{\tp@rulewidth}  \setlength{\tp@rulewidth}{5.5in}
\newcommand{\maketitlepage}{%
\thispagestyle{empty}
\begin{singlespace}
  {\centering
    \vspace*{58pt}
    \parbox{\tp@titlewidth}{\centering\bfseries\MakeUppercase{\@title}}\par
    \vspace{37pt}
    \rule{\tp@rulewidth}{0.4pt}\par
    \vspace{50pt}
    A \mydoctype\\
    Submitted to\\
    \ifthenelse{\equal{\mydepartment}{\relax}}{}{%
      \mydepartment \\
    }
    \ifthenelse{\equal{\myschool}{\relax}}{}{%
      \myschool \\
    }
    the \myuniversity{} \ifthenelse{\equal{\myorg}{\relax}}{}{\myorg{}}\par
    \vspace{21pt}
    \rule{\tp@rulewidth}{0.4pt}\par
    \vspace{24pt}
    In Partial Fulfillment\\
    of the Requirements for the Degree\\
    \MakeUppercase{\mydegree}\par
    \vspace{50pt}
    \rule{\tp@rulewidth}{0.4pt}\par
    \vspace{18pt}
    by\\
    \@author\\
    \@date\par
  }
  \vspace{52pt}
  \noindent Examining Committee Members:\par
  \vspace{14pt}
  \noindent\myadvisor
  \mycommitteemembers
\end{singlespace}
  \newpage
  \ifx\mycopyrightyear\@empty\else\makecopyrightpage\fi
}

%% Copyright Page
% Follows the Graduate School's copyright page: centered, single spaced, with
% the copyright symbol about 4.5in from the top edge of the page (3.5in below
% the 1in top margin), numbered ii.
\newlength{\tu@copyrightdrop} \setlength{\tu@copyrightdrop}{3.5in}
\newcommand{\makecopyrightpage}{%
  \thispagestyle{plain}%
  \begin{singlespace}
    \null\vspace*{\dimexpr\tu@copyrightdrop-\topskip-\baselineskip\relax}%
    \begin{center}
      \copyright\\
      Copyright\\
      \mycopyrightyear\\[\baselineskip]
      by\\[\baselineskip]
      \@author\\
      All Rights Reserved
    \end{center}
  \end{singlespace}
  \newpage
}

% \phantomsection gives hyperref an anchor for unnumbered ToC entries; it is a
% no-op when hyperref is not loaded.
\newcommand{\tu@phantomsection}{\ifdefined\phantomsection\phantomsection\fi}

%% Abstract
\renewenvironment{abstract}{
  \chapter*{Abstract}
  \tu@phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
}{
  \newpage
}

%% Acknowledgments
\newenvironment{acknowledgments}{
  \chapter*{Acknowledgments}
  \tu@phantomsection
  \addcontentsline{toc}{chapter}{Acknowledgments}
}{
  \newpage
}

%% Dedication Command
% Dedication environment should be on a new page, centered vertically and horizontally, and double spaced
\newenvironment{dedication}{
  % \chapter*{}
  \tu@phantomsection
  \addcontentsline{toc}{chapter}{Dedication}
  \vspace*{\fill}
  \begin{center}
}{
  \end{center}
  \vspace*{\fill}
  \newpage
}

%% Bibliography Integration
% \addbibresource{references.bib}

%% Custom Sectioning
% \titleformat{command}{format}{label}{sep}{before-code}
% Chapter, appendix, and front/back matter headings follow the Graduate
% School templates: body-size type, boldface, ALL CAPITALS, centered on the
% first line of the text block (the 1in top margin), with "CHAPTER n" or
% "APPENDIX X" on the line above the title at the surrounding line spacing.
% \chaptertitlename switches from \chaptername to \appendixname at \appendix.
\titleformat{\chapter}[display]
  {\normalfont\normalsize\bfseries\filcenter}
  {\MakeUppercase{\chaptertitlename}~\thechapter}
  {0pt}
  {\MakeUppercase}
\titleformat{name=\chapter,numberless}[block]
  {\normalfont\normalsize\bfseries\filcenter}
  {}
  {0pt}
  {\MakeUppercase}
% The negative space cancels the blank line titlesec's \vspace* leaves at the
% top of the page, so the heading's baseline sits at \topskip below the margin.
\titlespacing*{\chapter}{0pt}{-\baselineskip}{24pt}
\titleformat{\section}
  {\normalfont\bfseries}{\thesection}{1em}{\titlecap}
\titleformat{\subsection}
  {\normalfont\bfseries\itshape}{\thesubsection}{1em}{\titlecap}
\titleformat{\subsubsection}[runin]
  {\normalfont\bfseries}{\quad\thesubsubsection}{}{\titlecap}%{\titlecase{#1}.}
\titlespacing{\subsubsection}
  {\parindent}{*1}{*1}
\titleformat{\paragraph}[runin]
  {\normalfont\bfseries\itshape}{\quad\theparagraph}{}{\titlecap}%{\titlecase{#1}.}
\titlespacing{\paragraph}
  {\parindent}{*1}{*1}

%% Table of Contents and Lists of Tables, Figures, and Algorithms
% Format from the Graduate School's front matter template (Appendix G1):
%  - major heading, then the column labels ("Page" at the right margin; the
%    Lists also carry "Table"/"Figure"/"Algorithm" at the left), printed once;
%  - entries double spaced from one another, turnover lines single spaced and
%    aligned with the first word of the title;
%  - leader dots to right-aligned page numbers, with titles kept at least
%    1/2in clear of the page-number column;
%  - chapter-level ToC entries in ALL CAPITALS at the left margin, each
%    subheading level indented a further 1/2in.
\newlength{\tu@tocstep}        \setlength{\tu@tocstep}{0.5in}
\newlength{\tu@chapnumwidth}   \setlength{\tu@chapnumwidth}{0.375in}
\newlength{\tu@secnumwidth}    \setlength{\tu@secnumwidth}{0.5in}
\newlength{\tu@subsecnumwidth} \setlength{\tu@subsecnumwidth}{0.625in}
% Number column of the Lists: wide enough for appendix numbers like C.135.
\newlength{\tu@lofnumwidth}    \setlength{\tu@lofnumwidth}{3.4em}
\renewcommand\@pnumwidth{2em}
\renewcommand\@tocrmarg{\dimexpr\@pnumwidth+0.5in\relax}

% Lists are set ragged right, so titles are never hyphenated.
\newcommand{\tu@listspacing}{\setstretch{1}\hyphenpenalty\@M\exhyphenpenalty\@M}
\newcommand{\tu@entrysep}{\addvspace{\baselineskip}}
% \tu@dottedtocline is the kernel's \@dottedtocline set ragged right, with a
% minimum leader width so the last line of a title also stays 1/2in clear of
% its page number (the kernel lets the last line run into the right margin).
\newlength{\tu@minleader} \setlength{\tu@minleader}{0.5in}
\newcommand*{\tu@dottedtocline}[5]{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \@plus 1fil\relax
     \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}%
       \hskip\dimexpr\tu@minleader\relax \@plus 1fill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
% Extra space before a group (CHAPTER, BIBLIOGRAPHY): one blank double line.
\newcommand{\tu@tocgap}{\addvspace{3\baselineskip}}
\newcommand{\tu@toclabel}[1]{\tu@entrysep\noindent #1\par\nobreak}
\newcommand{\tu@listheader}[1]{\noindent #1\hfill Page\par}

% \tu@tocline{level}{indent}{numwidth}{text}{page}
\newcommand*{\tu@tocline}[5]{%
  \ifnum #1>\c@tocdepth\else
    \tu@entrysep
    \tu@dottedtocline{#1}{#2}{#3}{#4}{#5}%
  \fi}
\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth>\m@ne
    \addpenalty{-\@highpenalty}%
    \tu@tocline{0}{0pt}{\tu@chapnumwidth}{\MakeUppercase{#1}}{#2}%
    \penalty\@highpenalty
  \fi}
\renewcommand*{\l@section}{\tu@tocline{1}{\tu@tocstep}{\tu@secnumwidth}}
\renewcommand*{\l@subsection}{\tu@tocline{2}{2\tu@tocstep}{\tu@subsecnumwidth}}
\renewcommand*{\l@figure}{\tu@tocline{1}{0pt}{\tu@lofnumwidth}}
\let\l@table\l@figure

\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\tableofcontents}{%
  \chapter*{\contentsname}%
  \tu@listheader{}%
  % \setcounter is global, so restore tocdepth after the appendix entries
  % lower it; otherwise the Lists that follow would be suppressed.
  \edef\tu@savedtocdepth{\the\c@tocdepth}%
  \begingroup\tu@listspacing\@starttoc{toc}\endgroup
  \setcounter{tocdepth}{\tu@savedtocdepth}}
% \tu@makelist{ext}{heading}{column label}
\newcommand{\tu@makelist}[3]{%
  \chapter*{#2}%
  \tu@phantomsection
  \addcontentsline{toc}{chapter}{#2}%
  \tu@listheader{#3}%
  \begingroup\tu@listspacing\@starttoc{#1}\endgroup}
\renewcommand{\listoftables}{\tu@makelist{lot}{\listtablename}{Table}}
\renewcommand{\listoffigures}{\tu@makelist{lof}{\listfigurename}{Figure}}
% The algorithm package is loaded after this class.
\AtBeginDocument{%
  \@ifundefined{listofalgorithms}{}{%
    \renewcommand{\listofalgorithms}{%
      \tu@makelist{loa}{\listalgorithmname}{Algorithm}}%
    \let\l@algorithm\l@figure}}

%% Document Divisions
% \mainmatter starts Arabic page numbering and double spacing for the text
% and labels the chapter entries of the ToC with "CHAPTER".
% The toc write comes before \clearpage so it is shipped out ahead of the
% first \include, whose own aux file is linked in immediately.
\newcommand{\mainmatter}{%
  \addtocontents{toc}{\protect\tu@tocgap\protect\tu@toclabel{CHAPTER}}%
  \clearpage
  \pagenumbering{arabic}%
  \doublespacing}
% \backmatter separates the bibliography entry from the chapter entries.
\newcommand{\backmatter}{%
  \addtocontents{toc}{\protect\tu@tocgap}%
  \clearpage}
% Appendix entries follow an "APPENDICES" label in the ToC, which lists only
% the appendix letters and titles (Appendix G1), not their sections.
\g@addto@macro\appendix{%
  \addtocontents{toc}{\protect\tu@toclabel{APPENDICES}}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}}

%% Page Headers and Footers
% \pagestyle{fancy}
% \fancyhf{}
% \fancyhead[LE,RO]{\thepage}
% \fancyhead[LO]{\doctype}
% \fancyhead[RE]{\thesistitle}


\AtBeginDocument{
  \pagenumbering{roman} %% Front matter roman numerals
}

%% Begin the document
\pagestyle{plain}
\endinput
