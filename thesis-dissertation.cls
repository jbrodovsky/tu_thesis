%% thesis-dissertation.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-dissertation}[2025/01/17 Template for Theses and Dissertations]

%% Base class setup
\LoadClass[12pt]{report} % Report provides things like \abstract

%% Packages
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{ifthen}
\RequirePackage{graphicx}

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
    \g@addto@macro\myadvisor{#1, #2 (Advisor)\\}} 
\newcommand{\committeemember}[2]{%
  \g@addto@macro\mycommitteemembers{#1, #2\\}}
\newcommand{\university}[1]{\renewcommand{\myuniversity}{#1}}
\newcommand{\school}[1]{\renewcommand{\myschool}{#1}}
\newcommand{\department}[1]{\renewcommand{\mydepartment}{#1}}
\newcommand{\graduateorg}[1]{\renewcommand{\myorg}{#1}}

%% Title Page Command
\newcommand{\maketitlepage}{%
\thispagestyle{empty}
\begin{singlespace}
  \begin{center}
    \MakeUppercase{\@title} \\
    \bigskip 
    \hrulefill \\
    \bigskip 
    A \mydoctype\\
    Submitted to the\\
    \ifthenelse{\equal{\mydepartment}{\relax}}{}{%
      \mydepartment \\
    }
    \ifthenelse{\equal{\myschool}{\relax}}{}{%
      \myschool \\
    }
    \myuniversity{} \ifthenelse{\equal{\myorg}{\relax}}{}{\myorg{}}
    \\
    \bigskip
    \hrulefill \\
    \bigskip
    in Partial Fulfillment \\ 
    of the Requirements for the Degree of\\
    {\uppercase{\mydegree}}\\
    \bigskip
    \hrulefill \\
    \bigskip
    by\\
    \@author\\
    \@date\\
  \end{center}
  \vfill
  Examining Committee Members:\\\\
  \myadvisor
  \mycommitteemembers
  \newpage

% Copyright
%\newpage
\chapter*{} % Blank starred chapter commands are use to get the base page formatting correct
\vspace*{\fill}
\begin{center}
    \copyright \\
    Copyright \\
    \mycopyrightyear \\
    \vspace{0.5cm}
    \@author \\
    All rights reserved
\end{center}
\vspace*{\fill}
\end{singlespace}
\newpage
}

%% Abstract
\renewenvironment{abstract}{
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}{
  \newpage
}

%% Acknowledgments
\newenvironment{acknowledgments}{
  \chapter*{Acknowledgments}
  \addcontentsline{toc}{chapter}{Acknowledgments}
}{
  \newpage
}

%% Dedication Command
% Dedication environment should be on a new page, centered vertically and horizontally, and double spaced
\newenvironment{dedication}{
  \chapter*{}
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
\titleformat{\chapter}[display]
  {\normalfont\bfseries\filcenter}{\chaptername~\thechapter}{20pt}{\Large}
\titleformat{\section}
  {\normalfont\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\bfseries\itshape}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[runin]
  {\normalfont\bfseries}{\thesubsubsection}{}{}%{\titlecase{#1}.}
\titleformat{\paragraph}[runin]
  {\normalfont\bfseries\itshape}{\theparagraph}{}{}%{\titlecase{#1}.}

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
