\ProvidesClass{resume}[2010/09/17 v0.1 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[left=0.5in,top=0.5in,right=0.5in,bottom=0.5in]{geometry} % Document margins
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage[usenames,dvipsnames]{xcolor} % Colorize resume
\usepackage{hyperref} % Clickable links
\usepackage{xhfill} % Customizable hrulefill
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

\definecolor{accentColor}{RGB}{72,105,24}
\definecolor{titleColor}{RGB}{132,129,129}
\definecolor{textColor}{RGB}{90,91,94}
\definecolor{linkColor}{RGB}{49,117,194}

\hypersetup{
  colorlinks=true,
  urlcolor=linkColor
}

%----------------------------------------------------------------------------------------
%	HEADING
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{
  \def\@name{#1}
}
\def\@name{} % Sets \@name to empty by default

\newcommand{\jobtitle}[1] {
  \def\@jobtitle{#1} % Defines the \jobtitle command to set name
}

\newcommand{\address}[1]{\def\@address{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\email}[1]{\def\@email{#1}}

% \printname is used to print the name as a page header
\newcommand{\printname} {
  \begingroup
    \Large\bf\textcolor{accentColor}{\@name}\hfil
    \smallskip\break
  \endgroup
}

% \printjobtitle is used to print the name as a page header
\newcommand{\printjobtitle} {
  \begingroup
    \large\bf\textcolor{textColor}{\@jobtitle}\hfil
    \smallskip\break
  \endgroup
}

% \printjobtitle is used to print the name as a page header
\let\contactsize\normalsize
\let\contactskip\smallskip
\newcommand{\printcontact} {
  \begin{tabular}{ l l }
      \@ifundefined{@phone}{}{\contactsize\textcolor{accentColor}{Phone:} & \contactsize\bf\textcolor{textColor}{\@phone} \\ \noalign{\contactskip}}
      \@ifundefined{@address}{}{\contactsize\textcolor{accentColor}{Address:} & \contactsize\bf\textcolor{textColor}{\@address} \\ \noalign{\contactskip}}
      \@ifundefined{@website}{}{\contactsize\textcolor{accentColor}{Website:} & \contactsize\bf\href{\@website}{\@website} \\ \noalign{\contactskip}}
      \@ifundefined{@email}{}{\contactsize\textcolor{accentColor}{Email:} &  \contactsize\bf\href{mailto:\@email}{\@email}  \\}
  \end{tabular}
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@jobtitle}{}{\printjobtitle}
  \printcontact
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \smallskip
  \textcolor{accentColor}{\rule{1cm}{.4mm}\quad\hbox{\MakeUppercase{\bf{\textit{#1}}}}\quad\xhrulefill{accentColor}{.4mm}}
  \smallskip
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}
