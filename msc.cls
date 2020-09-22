% vim: set ft=tex:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msc}[2020/18/08 Style for my master thesis]

% General
\LoadClassWithOptions{scrreprt}

\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption{digital}{\@printfalse}

\ProcessOptions\relax

% Don't spread text vertically when a section ends
\raggedbottom

% Headline color
% \usepackage{xcolor}
% \usepackage{sectsty}
% \chapterfont{\color{blue}}  % sets colour of chapters
% \sectionfont{\color{cyan}}  % sets colour of sections

%
\usepackage{layouts}

% Chemical symbols
\usepackage{mhchem}

% plots
\usepackage{pgfplots}
\usetikzlibrary[pgfplots.groupplots]
\newlength\figureheight
\newlength\figurewidth

% Multicols
\usepackage{multicol}

% import
\usepackage{import}

% Todo lists
\usepackage{todonotes}

% Acronyms
\usepackage{acronym}

% Table
\usepackage{array}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{N}{@{}m{0pt}@{}}
\newcommand{\thickhline}{%
	\noalign {\ifnum 0=`}\fi \hrule height 1.5pt
	\futurelet \reserved@a \@xhline
}
\newcolumntype{!}{@{\hskip\tabcolsep\vrule width 1pt\hskip\tabcolsep}}
\renewcommand{\arraystretch}{1.4}

% Itemize
\usepackage{enumitem}
\setlist{nosep}

% Language
\usepackage[ngerman,english]{babel} % all languages being used, with main language last in list

% Geometry
\usepackage[onehalfspacing]{setspace}
\usepackage[a4paper,width=150mm,top=30mm,bottom=30mm]{geometry}

% Links
\usepackage{color,xcolor}
\usepackage{hyperref}
\hypersetup{colorlinks=false}
\hypersetup{linkbordercolor = {white}}
\AtBeginDocument{
	\hypersetup{ % set pdf metadata
	    pdfauthor={\@author},
		pdftitle={\@title}
	}
}

% Fonts
\usepackage{fontspec,xunicode}
\usepackage{libertine}
%\setmainfont{palatino}
%\setsansfont{Optima}
%\setmonofont[Scale=MatchLowercase]{Menlo}

% Greek letters
\usepackage{textgreek}

\if@print
\else
\usepackage{xcolor}
\definecolor{easygrey}{rgb}{.137,.137,.137}
\makeatletter
\newcommand{\globalcolor}[1]{%
	\color{#1}\global\let\default@color\current@color
}
\makeatother

\AtBeginDocument{\globalcolor{easygrey}}
\fi

% Units
\usepackage[separate-uncertainty, binary-units = true]{siunitx}
%\sisetup{output-exponent-marker=\ensuremath{\mathrm{\,e}}}
\DeclareSIUnit\px{px}

% BraKets
\usepackage{braket}

% Tables
\usepackage{array} % for math mode in tables
\usepackage{booktabs} % for hline rules

% Quotations
\usepackage{epigraph}
\setlength{\epigraphwidth}{.8\textwidth}
\setlength{\epigraphrule}{0pt}

% Page Layout
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\if@print
	\fancyhead[LE]{
	    \textit{\nouppercase{\leftmark}}
	}
	\fancyhead[RO]{
		\textit{\nouppercase{\rightmark}}
	}
	\fancyfoot[RO,LE]{
		\thepage
	}
\else
	\fancyhead[L]{
	    \textit{\nouppercase{\leftmark}}
	}
	\fancyfoot[C]{
		\thepage
	}
\fi
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
	\fancyhf{}
	\if@print
		\fancyfoot[RO,LE]{
			\thepage
		}
	\else
		\fancyfoot[C]{
			\thepage
		}
	\fi
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}


% Bibliography
\usepackage[natbib=true, sorting=none, style=nature, backend=biber, hyperref=true, url=false, isbn=false, doi=false, backref=true, block=none, urldate=short]{biblatex}
% Grey out page numbers
\DeclareFieldFormat{pagerefformat}{{\color{gray}\mkbibparens{#1}
	\hypersetup{linkcolor=gray}}}
	\renewbibmacro*{pageref}{%
		\iflistundef{pageref}{}{
			\printtext[pagerefformat]{%
				\ifnumgreater{
					\value{pageref}}{1}{\bibstring{backrefpages}\ppspace}
				{\bibstring{backrefpage}\ppspace}%
				\hypersetup{linkcolor=gray}\printlist[pageref][-\value{listtotal}]{pageref}\hypersetup{linkcolor=gray}}}}

% Appendix
\usepackage[toc,page]{appendix}


\endinput
