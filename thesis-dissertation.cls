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
  % \chapter*{}
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
\titleformat{\chapter}[display]
  {\bfseries\filcenter\Large}
  {\chaptername~\thechapter}
  {0pt}
  {\titlecap}
%\bfseries\filcenter\Large
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
