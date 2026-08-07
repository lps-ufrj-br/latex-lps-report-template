


\def\filename{coppe.dtx}
\def\fileversion{v3.4}
\def\filedate{2024/01/24}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{coppe}[\filedate\ \fileversion\ COPPE Dissertations and Thesis]
\LoadClass[12pt,a4paper,oneside]{book}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{hyphenat}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage{etoolbox}
\RequirePackage{eqparbox}
\RequirePackage{ltxcmds}
\RequirePackage{tikz}
\RequirePackage[T1]{fontenc}
\RequirePackage{acronym}
\RequirePackage{sectsty}
\sectionfont{\color{myblue}}
\subsectionfont{\color{myblue}}
\subsubsectionfont{\color{myblue}}
\RequirePackage[a4paper,vcentering=true,top=2.0cm,bottom=2.0cm,left=3.0cm,right=2.5cm,headheight=1.5cm,headsep=0.5cm,footskip=1.0cm]{geometry}
\def\CoppeTeX{{\rm C\kern-.05em{\sc o\kern-.025em p\kern-.025em
p\kern-.025em e}}\kern-.08em
T\kern-.1667em\lower.5ex\hbox{E}\kern-.125emX\spacefactor1000}
\newboolean{maledoc}
\setboolean{maledoc}{false}
\newif\if@english\@englishfalse

\DeclareOption{english}{\@englishtrue}
\DeclareOption{portuguese}{\@englishfalse}
\DeclareOption{portugues}{\@englishfalse}

\ProcessOptions\relax
\if@english
  \RequirePackage[brazilian,english]{babel}
\else
  \RequirePackage[english,brazilian]{babel}
\fi

\addto{\captionsenglish}{%
  \renewcommand{\bibname}{References}
}

\renewcommand\title[1]{%
  \global\def\local@title{#1}%
}

%
% My colors
%
\definecolor{myyellow}{RGB}{192,215,0}
\definecolor{alert}{RGB}{194, 31, 48}
\definecolor{myblue}{RGB}{15, 44, 75}
\definecolor{myorange}{RGB}{255, 150, 58}

\newcount\@advisor\@advisor0
\newcommand\advisor[4]{%
  \global\@namedef{CoppeAdvisorTitle:\expandafter\the\@advisor}{#1}
  \global\@namedef{CoppeAdvisorName:\expandafter\the\@advisor}{#2}
  \global\@namedef{CoppeAdvisorSurname:\expandafter\the\@advisor}{#3}
  \global\@namedef{CoppeAdvisorDegree:\expandafter\the\@advisor}{#4}
  \global\advance\@advisor by 1
  \ifnum\@advisor>1
    \renewcommand\local@advisorstring{Orientadores}
    \renewcommand\foreign@advisorstring{Advisors}
  \fi
}
\newcount\@authorreportcount\@authorreportcount0
\newcommand\authorreport[3]{%
  \global\@namedef{CoppeAuthorReport:\expandafter\the\@authorreportcount}{#1\ #2}
  \global\advance\@authorreportcount by 1
}
\newcount\@laboratorycount\@laboratorycount0
\newcommand\laboratory[4]{%
  \global\@namedef{CoppeLaboratoryName:\the\@laboratorycount}{#1}
  \global\@namedef{CoppeLaboratoryAcronym:\the\@laboratorycount}{#2}
  \global\@namedef{CoppeLaboratoryLogo:\the\@laboratorycount}{#3}
  \global\@namedef{CoppeLaboratoryLogoWidth:\the\@laboratorycount}{#4}
  \global\advance\@laboratorycount by 1
}
\renewcommand\author[2]{%
  \global\def\@authname{#1}
  \global\def\@authsurn{#2}
}
\newcommand\coordinator[1]{\global\def\@coordinator{#1}}
\newcommand\subcoordinator[1]{\global\def\@subcoordinator{#1}}
\newcommand\projectduration[1]{\global\def\@projectduration{#1}}
\newcommand\projectphase[1]{\global\def\@projectphase{#1}}
\newcommand\projectdepartment[1]{\global\def\@projectdepartment{#1}}
\newcommand\reportcode[1]{\global\def\@reportcode{#1}}
\newcommand\coppetecproject[1]{\global\def\@coppetecproject{#1}}
\newcommand\embrapiiproject[1]{\global\def\@embrapiiproject{#1}}
\newcommand\reportversion[1]{\global\def\@reportversion{#1}}
\newcommand\cooperationterm[1]{\global\def\@cooperationterm{#1}}
\newcommand\interlocutor[1]{\global\def\@interlocutor{#1}}
\newcommand\finalclient[1]{\global\def\@finalclient{#1}}
\newcommand\projecttitle[1]{\global\def\@projecttitle{#1}}
\newcommand\coordinatorsignature[1]{\global\def\@coordinatorsignature{#1}}
\global\def\@coordinator{Nome do Coordenador}
\global\def\@subcoordinator{Nome do Subcoordenador}
\global\def\@finalclient{Petrobras}
\global\def\@projectduration{Duração do Projeto}
\global\def\@projectphase{Fase Associada}
\global\def\@projectdepartment{Departamento}
\global\def\@projecttitle{TÍTULO DO PROJETO}
\global\def\@reportcode{Código do Relatório}
\global\def\@coordinatorsignature{template/logos/my_signature.pdf}

\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \Huge \bfseries \textcolor{myblue}{\ifnum \c@secnumdepth >\m@ne \thechapter. \fi #1}\par\nobreak
    \vskip 20\p@
  }}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries \textcolor{myblue}{#1}\par\nobreak
    \vskip 20\p@
  }}
\global\def\@reportversion{1.0}
\global\def\@coppetecproject{N/A}
\global\def\@embrapiiproject{N/A}
\global\def\@cooperationterm{N/A}
\global\def\@interlocutor{N/A}
\global\def\@projectdepartment{Departamento}

\newtoks\copperevisiontoks
\copperevisiontoks={}
\newcommand\revisionnote[2]{%
  \global\copperevisiontoks=\expandafter{\the\copperevisiontoks #1 & #2 \\ \hline}%
}

\renewcommand\date[2]{%
  \month=#1
  \year=#2
}

\newcommand\local@monthname{\ifcase\month\or
  Janeiro\or Fevereiro\or Mar{\c c}o\or Abril\or Maio\or Junho\or
  Julho\or Agosto\or Setembro\or Outubro\or Novembro\or Dezembro\fi}
\newcommand\foreign@monthname{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\newcounter{keywords}
\newcommand\keyword[1]{%
  \global\@namedef{CoppeKeyword:\expandafter\the\c@keywords}{#1}
  \global\addtocounter{keywords}{1}
}
\providecommand\local@doctype{Documento}
\providecommand\@degreename{Relatório}
\providecommand\local@deptname{LPS}
\newcommand\freeconfig[6]{%
\providecommand\@degree{}
\renewcommand\@degree{#1}
\providecommand\@degreename{}
\renewcommand\@degreename{#2}
\providecommand\local@degname{}
\renewcommand\local@degname{#3}
\providecommand\foreign@degname{}
\renewcommand\foreign@degname{#4}
\providecommand\local@doctype{}
\renewcommand\local@doctype{#5}
\providecommand\foreign@doctype{}
\renewcommand\foreign@doctype{#6}%
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \thispagestyle{plain}
  \setcounter{page}{2}
  \makefrontpage
  \clearpage
  \makeauthorspage
  \clearpage
  %\makelaboratorypage
  \clearpage
  \makelaboratorylogopage
  \clearpage
  \makerevisionpage
  \clearpage
  \pagestyle{plain}
  \ifthenelse{\boolean{maledoc}}{}{\makecatalog}%
}
\renewcommand\mainmatter{%
  \coppe@mainBegin
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{plain}
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi}



%
% This is the cover
%
%
\renewcommand\maketitle{%
  \pagenumbering{alph}
  \ltx@ifpackageloaded{hyperref}{\coppe@hypersetup}{}%
  \begin{titlepage}
  \begin{tikzpicture}[remember picture, overlay]
    
    %% 1) Background (myblue)
    \fill[myblue] (current page.north west) rectangle (current page.south east);

    %% 5) LPS Signal White Logo
    \node[anchor=center, yshift=3.4cm, opacity=1] at (current page.center) {
        \includegraphics[width=1.05\linewidth]{template/logos/LPS_signal_white.pdf}
    };

    %% 2) Project Title (Center)
    \node (title) [anchor=center, text width=16cm, align=center, yshift=-2cm] at (current page.center) {
        {\setstretch{2.4}\textcolor{white}{\fontsize{33}{46}\selectfont\bfseries{\@projecttitle}}\par}
        \vspace{12ex}
        {\textcolor{white}{\fontsize{24}{28}\bfseries\selectfont\local@title}}
    };

    %% Horizontal Line below title
    \draw[white, line width=1.5pt] (title.south west) ++(0, 2.7cm) -- +(16.2cm, 0);

    %% 3) UFRJ Logo (Bottom Center)
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal_white.pdf}};

    %% Report Version/Edition (Top Center)
    \node[anchor=north, yshift=-0.8cm, align=center] at (current page.north) {
        {\fontsize{14}{16}\selectfont\bfseries\textcolor{white}{\MakeUppercase{\editionname\ \@reportversion}}}\\[0.1cm]
        {\fontsize{12}{14}\selectfont\textcolor{white}{COPPETEC \@coppetecproject\ | EMBRAPII \@embrapiiproject}}
    };

    %% Vertical White Line on the Right
    \draw[white, line width=3.5pt] ([xshift=-1.5cm]current page.north east) -- ([xshift=-1.5cm]current page.south east);

    %% Cooperation Term (Vertical)
    \node[anchor=north east, xshift=-1.1cm, yshift=-23.5cm, rotate=90] at (current page.north east) {
        \textcolor{myorange}{\bfseries Nº TC \@cooperationterm} 
    };


  \end{tikzpicture}
  \end{titlepage}
  \global\let\maketitle\relax
  \global\let\and\relax
}



%
% This is the second page
%
\newcommand\makefrontpage{%


  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}

  \vspace{2cm}

  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{7mm}
  \end{center}\par
  
  
  \vspace*{4mm}
  \frontpage@maintext 
  

  \vspace{1cm}
  
  \noindent
  \begin{tabularx}{\textwidth}{|l|X|}
    \hline
    \textbf{\coordinatorname} & \@coordinator \\ \hline
    %\textbf{Subcoordenador} & \@subcoordinator \\ \hline
    \textbf{\reportcodename} & \@reportcode \\ \hline
    \textbf{\reportversionname} & \@reportversion \\ \hline
    \textbf{\coppetecprojectname} & \@coppetecproject \\ \hline
    \textbf{\embrapiiprojectname} & \@embrapiiproject \\ \hline
    \textbf{\cooperationtermname} & \@cooperationterm \\ \hline
    \textbf{\interlocutorname} & \@interlocutor \\ \hline
    \textbf{\projectphasename} & \@projectphase \\ \hline
    \textbf{\projectdurationname} & \@projectduration \\ \hline
    %\textbf{Departamento} & \@projectdepartment \\ \hline
    \textbf{\finalclientname} & \@finalclient \\ \hline
  \end{tabularx}  \vspace{0.5cm}

  \vspace{2cm}
  \begin{center}
      \centering
      \includegraphics[width=0.6\linewidth]{\@coordinatorsignature}\\[-45pt]
      \rule{10cm}{0.4pt}\\
      \vspace{0.2cm}
      \textbf{\@coordinator}\\
      \coordinatortitle
  \end{center}
  \vspace*{1.5cm}
  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}




%
% this is the lab/logo page
%
\newcommand\makelaboratorylogopage{%
  \thispagestyle{plain}

  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}

  \vspace{2cm}

  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{7mm}
  \end{center}\par
  
  \noindent \labcollaborationtext
  \vspace{1cm}
  
  \begin{center}

    \gdef\lablogorows{}
    \count1=0
    \def\do@lablogoloop{%
      \ifnum\count1<\@laboratorycount
        \edef\temp@labname{\csname CoppeLaboratoryName:\the\count1\endcsname}%
        \edef\temp@labacro{\csname CoppeLaboratoryAcronym:\the\count1\endcsname}%
        \edef\temp@lablogo{\csname CoppeLaboratoryLogo:\the\count1\endcsname}%
        \edef\temp@labwidth{\csname CoppeLaboratoryLogoWidth:\the\count1\endcsname}%
        % Build the row expanding the current values
        \ifx\temp@lablogo\empty
          \edef\nextrow{\noexpand\rule[-1.1cm]{0pt}{2.2cm}\noexpand\begin{minipage}[c]{\noexpand\linewidth}\noexpand\centering \temp@labname\ (\temp@labacro)\noexpand\end{minipage} & --- \noexpand\\ \noexpand\hline}%
        \else
          \edef\nextrow{\noexpand\rule[-1.1cm]{0pt}{2.2cm}\noexpand\begin{minipage}[c]{\noexpand\linewidth}\noexpand\centering \temp@labname\ (\temp@labacro)\noexpand\end{minipage} & $\vcenter{\hbox{\noexpand\includegraphics[width=\temp@labwidth\noexpand\linewidth, keepaspectratio]{\temp@lablogo}}}$ \noexpand\\ \noexpand\hline}%
        \fi
        \toks0=\expandafter{\lablogorows}%
        \toks1=\expandafter{\nextrow}%
        \xdef\lablogorows{\the\toks0 \the\toks1}%
        \advance\count1 by 1
        \expandafter\do@lablogoloop
      \fi
    }%
    \do@lablogoloop
    
    \begingroup
    \renewcommand{\tabularxcolumn}[1]{m{##1}}
    \begin{tabularx}{\textwidth}{|>{\centering\arraybackslash}X|>{\centering\arraybackslash}m{5cm}|}
      \hline
      \textbf{\labnametext} & \textbf{\logotext} \\ \hline
      \lablogorows
    \end{tabularx}
    \endgroup
  \end{center}

  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}

%
% This is the revision page
%
\newcommand\makerevisionpage{%


  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}
  \vspace{2cm}

  \thispagestyle{plain}
  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{7mm}
  \end{center}\par
  \vspace*{1.5cm}
  
  \noindent \textbf{\Large \revisionhistorytitle}
  \vspace{1cm}
  
  \noindent
  \begin{tabularx}{\textwidth}{|c|X|}
    \hline
    \textbf{\versiontext} & \multicolumn{1}{c|}{\textbf{\descriptiontext}} \\
    \hline
    \the\copperevisiontoks
  \end{tabularx}
  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}

%
% This is the authors page
%
\newcommand\makeauthorspage{%

  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}

  \vspace{2cm}

  \thispagestyle{plain}
  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{7mm}
  \end{center}\par
  \vspace*{1.5cm}
  \noindent
  \gdef\authrows{}
  \count1=0
  \def\do@authloop{%
    \ifnum\count1<\@authorreportcount
      \edef\temp@auth{\csname CoppeAuthorReport:\the\count1\endcsname}%
      \ifnum\count1=0
        \xappto\authrows{\temp@auth\noexpand\\}%
      \else
        \xappto\authrows{& \temp@auth\noexpand\\}%
      \fi
      \advance\count1 by 1
      \expandafter\do@authloop
    \fi
  }%
  \do@authloop

  \begin{tabularx}{\textwidth}[b]{@{}l@{ }>{\raggedright\arraybackslash}X@{}}
    \textbf{\authorstext} & \authrows
  \end{tabularx}
  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}

%
% This is the lab page
%
\newcommand\makelaboratorypage{%

  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}

  \vspace{2cm}

  \thispagestyle{plain}
  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{7mm}
  \end{center}\par
  \vspace*{1.5cm}
  \noindent
  \gdef\labrows{}
  \count1=0
  \def\do@labloop{%
    \ifnum\count1<\@laboratorycount
      \edef\temp@lab{\csname CoppeLaboratoryName:\the\count1\endcsname}%
      \ifnum\count1=0
        \xappto\labrows{\temp@lab\noexpand\\}%
      \else
        \xappto\labrows{& \temp@lab\noexpand\\}%
      \fi
      \advance\count1 by 1
      \expandafter\do@labloop
    \fi
  }%
  \do@labloop

  \begin{tabularx}{\textwidth}[b]{@{}l@{ }>{\raggedright\arraybackslash}X@{}}
    \textbf{\laboratorieslisttext} & \labrows
  \end{tabularx}
  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}


  
\newcommand\coppe@hypersetup{%
\begingroup
  % changes to \toks@ and \count@ are kept local;
  % it's not necessary for them, but it is usually the case
  % for \count1, because the first ten counters are written
  % to the DVI file, thus you got lucky because of PDF output
  \gdef\keywordlist{}
  \count@=0 
  \def\do@keyloop{%
    \ifnum\count@<\value{keywords}
      \edef\temp@key{\csname CoppeKeyword:\the\count@\endcsname}%
      \ifnum\count@=0
        \xappto\keywordlist{\temp@key}%
      \else
        \xappto\keywordlist{; \temp@key}%
      \fi
      \advance\count@ by 1 
      \expandafter\do@keyloop
    \fi
  }%
  \do@keyloop
  \edef\x{\endgroup
    \noexpand\hypersetup{%
      pdfkeywords={\keywordlist}%
    }%
  }%
\x
\hypersetup{%
  pdfauthor={\@authname\ \@authsurn},
  pdftitle={\local@title},
  pdfsubject={\local@doctype\ de \@degreename\ em \local@deptname\ da COPPE/UFRJ},
  pdfcreator={LaTeX with CoppeTeX toolkit},
  breaklinks={true},
  raiselinks={true},
  pageanchor={true},
}}





%
% warning page
%
\newcommand\makecatalog{%

  % Head of the page
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north west, xshift=2cm, yshift=-1.5cm] at (current page.north west) {
        \begin{tabular}{@{}l@{\hspace{0.5cm}}l@{}}
            \includegraphics[height=1.5cm]{template/logos/LPS_signal_blue.pdf} & 
            \begin{tabular}[b]{@{}l@{}} 
                \textbf{\footnotesize \textcolor{myblue}{Laboratório de Processamento de Sinais - LPS/COPPE}} \\ 
                \textbf{\footnotesize \textcolor{myblue}{Universidade Federal do Rio de Janeiro}} \\
                \textbf{\footnotesize \textcolor{myblue}{\local@cityname, \local@date}}
            \end{tabular}
        \end{tabular}
    };
  \end{tikzpicture}

  \vspace{7.5cm}
  \begin{center}
    \setlength{\fboxsep}{5mm}
    \framebox[120mm][c]{
      \begin{minipage}[c]{105mm}
      \noindent\input{metadatas/warning_message.tex}
    \end{minipage}
    }
  \end{center}
  \vspace*{\fill}
  \begin{tikzpicture}[remember picture, overlay]
    \path (current page.east) ++(-1.5cm, 0) node[rotate=90, font=\large] {\MakeUppercase{Universidade Federal do Rio de Janeiro}};
    \node[anchor=south, yshift=1.5cm] at (current page.south) {\includegraphics[width=0.4\linewidth]{template/logos/ufrj_horizontal.pdf}};
  \end{tikzpicture}
}










\newenvironment{abstract}{%
  \clearpage
  \thispagestyle{plain}
  \abstract@toptext\par
  \vspace*{8.6mm}
  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\local@title}\par
    \vspace*{13.2mm}
    \@authname\ \@authsurn \par
    \vspace*{7mm}
    \local@monthname/\number\year
  \end{center}\par
  \vspace*{\fill}
  \noindent%
  \begin{tabularx}{\textwidth}[b]{@{}l@{ }>{\raggedright\arraybackslash}X@{}}
    \local@advisorstring: &
    \count1=0
    \toks@={}
    \@whilenum \count1<\@advisor \do{%
    \ifcase\count1 % same as \ifnum0=\count1
      \toks@=\expandafter{\csname CoppeAdvisorName:\the\count1%
      \expandafter\endcsname\expandafter\space%
      \csname CoppeAdvisorSurname:\the\count1\endcsname\\}
    \else
      \toks@=\expandafter\expandafter\expandafter{%
        \expandafter\the\expandafter\toks@
        \expandafter&\expandafter\space
        \csname CoppeAdvisorName:\the\count1\expandafter\endcsname%
        \expandafter\space\csname CoppeAdvisorSurname:\the\count1\endcsname\\
      }%
    \fi
    \advance\count1 by 1}
    \the\toks@
  \end{tabularx}\par
  \vspace*{2mm}
  \noindent\local@deptstring: \local@deptname\par
  \vspace*{7mm}}{\vspace*{\fill}}


\newenvironment{foreignabstract}{%
  \clearpage
  \thispagestyle{plain}
  \begin{otherlanguage}{english}
  \foreignabstract@toptext\par
  \vspace*{8.6mm}
  \begin{center}
    \sloppy\nohyphens{\MakeUppercase\foreign@title}\par
    \vspace*{13.2mm}
    \@authname\ \@authsurn \par
    \vspace*{7mm}
    \foreign@monthname/\number\year
  \end{center}\par
  \vspace*{\fill}
  \noindent%
  \begin{tabularx}{\textwidth}[b]{@{}l@{ }>{\raggedright\arraybackslash}X@{}}
    \foreign@advisorstring: &
    \count1=0
    \toks@={}
    \@whilenum \count1<\@advisor \do{%
    \ifcase\count1 % same as \ifnum0=\count1
      \toks@=\expandafter{\csname CoppeAdvisorName:\the\count1%
      \expandafter\endcsname\expandafter\space%
      \csname CoppeAdvisorSurname:\the\count1\endcsname\\}
    \else
      \toks@=\expandafter\expandafter\expandafter{%
        \expandafter\the\expandafter\toks@
        \expandafter&\expandafter\space
        \csname CoppeAdvisorName:\the\count1\expandafter\endcsname%
        \expandafter\space\csname CoppeAdvisorSurname:\the\count1\endcsname\\
      }%
    \fi
    \advance\count1 by 1}
    \the\toks@
  \end{tabularx}\par
  \vspace*{2mm}
  \noindent\foreign@deptstring: \foreign@deptname\par
  \vspace*{7mm}}{%
  \end{otherlanguage}
  \vspace*{\fill}
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\foreign@title\@empty
  \global\let\foreign@title\relax
  \global\let\local@title\@empty
  \global\let\local@title\relax
  \global\let\author\relax
  \global\let\author\relax
  \global\let\date\relax}


  
\renewcommand\listoffigures{%
    \coppe@hasLof
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }


    
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }


    
\newcommand\printlosymbols{%
\renewcommand\glossaryname{\listsymbolname}%
\@input@{\jobname.los}}
\def\makelosymbols{%
  \newwrite\@losfile
  \immediate\openout\@losfile=\jobname.syx
  \newcommand\symbl[3][]{\@bsphack\begingroup
  \ifstrempty{##1}{\def\@tempsymbl{##2=}}{\def\@tempsymbl{##1=}}%
             \@sanitize%
             \@wrlos{\@tempsymbl}{##2}{##3}}\typeout%
  {Writing index of symbols file \jobname.syx}%
  \let\makelosymbols\@empty%
}%
\@onlypreamble\makelosymbols
\AtBeginDocument{%
\@ifpackageloaded{hyperref}{%
  \newcommand\@wrlos[3]{%
    \protected@write\@losfile{}%
      {\string\indexentry{#1[#2] #3|hyperpage}{\thepage}}%
    \endgroup%
    \@esphack}}{%
  \newcommand\@wrlos[3]{%
    \protected@write\@losfile{}%
      {\string\indexentry{#1[#2] #3}{\thepage}}%
    \endgroup%
    \@esphack}}}%
\newcommand\printloabbreviations{%
  \chapter*{\textcolor{myblue}{\listabbreviationname}}
  \@mkboth{\MakeUppercase\listabbreviationname}{\MakeUppercase\listabbreviationname}
  \addcontentsline{toc}{chapter}{\listabbreviationname}
  \input{metadatas/abreviations.tex}
}
\def\makeloabbreviations{%
  \newwrite\@labfile
  \immediate\openout\@labfile=\jobname.abx
   \newcommand\abbrev[3][]{\@bsphack\begingroup
              \ifstrempty{##1}{\def\@tempsymbl{##2=}}{\def\@tempsymbl{##1=}}
              \@sanitize
              \@wrlab{\@tempsymbl}{##2}{##3}}\typeout
  {Writing index of abbreviations file \jobname.abx}%
  \let\makeloabbreviations\@empty
}
\@onlypreamble\makeloabbreviations
\AtBeginDocument{%
\@ifpackageloaded{hyperref}{%
  \newcommand\@wrlab[3]{%
    \protected@write\@labfile{}%
      {\string\indexentry{#1[#2] #3|hyperpage}{\thepage}}%
    \endgroup%
    \@esphack}}{%
  \newcommand\@wrlab[3]{%
    \protected@write\@labfile{}%
      {\string\indexentry{#1[#2] #3}{\thepage}}%
    \endgroup%
    \@esphack}}}%
%%%%    \begin{macrocode}
%%%% \AtBeginDocument{%
%%%% \@ifpackageloaded{hyperref}{%
%%%%   \def\@wrlab#1#2{%
%%%% \protected@write\@labfile{}%
%%%%       {\string\indexentry{[#1] #2|hyperpage}{\thepage}}%
%%%%     \endgroup
%%%%     \@esphack}}{%
%%%%   \def\@wrlab#1#2{%
%%%%     \protected@write\@labfile{}%
%%%%       {\string\indexentry{[#1] #2}{\arabic{page}}}%
%%%%     \endgroup
%%%%     \@esphack}}}
\AtBeginDocument{%
  \ltx@ifpackageloaded{hyperref}{
    \def\coppe@bibEnd{%
      \immediate\write\@auxout{%
        \string\newlabel{bib:end}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}}%
    \def\coppe@bibBegin{%
      \immediate\write\@auxout{%
        \string\newlabel{bib:begin}{{}{\arabic{page}}{}{page.\arabic{page}}{}}}}%
    \def\coppe@mainBegin{%
      \immediate\write\@auxout{%
        \string\newlabel{front:pageno}{{}{\Roman{page}}{}{page.\roman{page}}{}}}}%
    \def\coppe@hasLof{%
      \immediate\write\@auxout{%
        \string\newlabel{cat:lofflag}{{}{:~il.;}{}{page.\roman{page}}{}}}}%
  }{%
    \def\coppe@bibEnd{%
      \immediate\write\@auxout{%
      \string\newlabel{bib:end}{{}{\arabic{page}}{}}}}%
    \def\coppe@bibBegin{%
      \immediate\write\@auxout{%
      \string\newlabel{bib:begin}{{}{\arabic{page}}{}}}}%
    \def\coppe@mainBegin{%
      \immediate\write\@auxout{%
        \string\newlabel{front:pageno}{{}{\Roman{page}}{}}}}%
    \def\coppe@hasLof{%
      \immediate\write\@auxout{%
        \string\newlabel{cat:lofflag}{{}{:~il.;}{}}}}%
  }%
}
\newdimen\bibindent%
\setlength\bibindent{1.5em}%
\renewenvironment{thebibliography}[1]%
     {\onehalfspacing%
      \chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \coppe@bibBegin
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\setlength{\labelwidth}{0ex}%
            \setlength{\leftmargin}{9.0ex}%
            \setlength{\itemindent}{-9.0ex}%
            \advance\leftmargin\labelsep%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy%
      \clubpenalty4000%
      \@clubpenalty \clubpenalty%
      \widowpenalty4000%
      \sfcode`\.\@m}%
     {\def\@noitemerr%
       {\@latex@warning{Empty `thebibliography' environment}}%
       \coppe@bibEnd
      \endlist}
\newlength{\recuolongquote}%
\setlength{\recuolongquote}{4cm}%
\newenvironment*{longquote}[1][default]{%
\list{}%
\footnotesize%
\addtolength{\leftskip}{\recuolongquote}%
\item[]%
\singlespacing%
\ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
}{\endlist}%
\newenvironment{theglossary}{%
  \if@twocolumn%
    \@restonecoltrue\onecolumn%
  \else%
    \@restonecolfalse%
  \fi%
  \@mkboth{\MakeUppercase\glossaryname}%
  {\MakeUppercase\glossaryname}%
  \chapter*{\glossaryname}%
  \addcontentsline{toc}{chapter}{\glossaryname}
  \list{}
  {\setlength{\listparindent}{0in}%
   \setlength{\labelwidth}{1.0in}%
   \setlength{\leftmargin}{1.5in}%
   \setlength{\labelsep}{0.5in}%
   \setlength{\itemindent}{0in}}%
   \sloppy}%
  {\if@restonecol\twocolumn\fi%
\endlist}
\renewenvironment{theindex}{%
  \if@twocolumn
    \@restonecolfalse
  \else
    \@restonecoltrue
  \fi
  \twocolumn[\@makeschapterhead{\indexname}]%
  \@mkboth{\MakeUppercase\indexname}%
  {\MakeUppercase\indexname}%
  \thispagestyle{plain}\parindent\z@
  \addcontentsline{toc}{chapter}{\indexname}
  \parskip\z@ \@plus .3\p@\relax
  \columnseprule \z@
  \columnsep 35\p@
  \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\if@english
  \newcommand\listabbreviationname{List of Abbreviations}
  \newcommand\listsymbolname{List of Symbols}
  \newcommand\glossaryname{Glossary}
  \newcommand\local@date{\foreign@monthname\ \number\day, \number\year}
  \newcommand\coordinatorname{Coordinator}
  \newcommand\reportcodename{Report code}
  \newcommand\reportversionname{Report version}
  \newcommand\coppetecprojectname{Coppetec project number}
  \newcommand\embrapiiprojectname{Embrapii project number}
  \newcommand\cooperationtermname{Cooperation Agreement No.}
  \newcommand\interlocutorname{Interlocutor}
  \newcommand\projectphasename{Associated phase}
  \newcommand\projectdurationname{Project duration}
  \newcommand\finalclientname{Final client}
  \newcommand\coordinatortitle{Project Coordinator}
  \newcommand\labcollaborationtext{This report was developed in technical-scientific collaboration between the following laboratories:}
  \newcommand\labnametext{Laboratory Name}
  \newcommand\logotext{Logo}
  \newcommand\revisionhistorytitle{Revision History}
  \newcommand\versiontext{Version}
  \newcommand\descriptiontext{Description}
  \newcommand\authorstext{Authors:}
  \newcommand\laboratorieslisttext{Laboratories:}
  \newcommand\editionname{Version}
  \newcommand\frontpage@maintext{%
    \noindent TECHNICAL REPORT SUBMITTED TO THE PETROBRAS EVALUATION BOARD AS AN INTEGRAL PART OF THE RESEARCH, DEVELOPMENT, AND INNOVATION ACTIVITIES RELATED TO THE ABOVE-MENTIONED PROJECT.\\
  }
  \newcommand\frontpage@bottomtext{%
    \begin{center}
    {\MakeUppercase{\local@cityname, \local@statename\ -- \local@countryname}}\par
    {\MakeUppercase{\foreign@monthname\ \number\year}}
    \end{center}%
  }
  \newcommand\abstract@toptext{%
    \noindent Summary of the report presented
  }
  \newcommand\foreignabstract@toptext{%
    \noindent Resumo do relatório apresentado
  }
\else
  \newcommand\listabbreviationname{Lista de Abreviaturas}
  \newcommand\listsymbolname{Lista de S{\' i}mbolos}
  \newcommand\glossaryname{Gloss{\' a}rio}
  \newcommand\local@date{\number\day\ de \local@monthname\ de \number\year}
  \newcommand\coordinatorname{Coordenador}
  \newcommand\reportcodename{Código do relatório}
  \newcommand\reportversionname{Versão do relatório}
  \newcommand\coppetecprojectname{Número do projeto Coppetec}
  \newcommand\embrapiiprojectname{Número do projeto Embrapii}
  \newcommand\cooperationtermname{Nº Termo de Cooperação}
  \newcommand\interlocutorname{Interlocutor}
  \newcommand\projectphasename{Fase associada}
  \newcommand\projectdurationname{Duração do projeto}
  \newcommand\finalclientname{Cliente final}
  \newcommand\coordinatortitle{Coordenador do Projeto}
  \newcommand\labcollaborationtext{Este relatório foi desenvolvido em regime de colaboração técnico-científica entre os seguintes laboratórios:}
  \newcommand\labnametext{Nome do Laboratório}
  \newcommand\logotext{Logomarca}
  \newcommand\revisionhistorytitle{Histórico de Revisões}
  \newcommand\versiontext{Versão}
  \newcommand\descriptiontext{Descrição}
  \newcommand\authorstext{Autores:}
  \newcommand\laboratorieslisttext{Laboratórios:}
  \newcommand\editionname{Edição}
  \newcommand\frontpage@maintext{%
    \noindent RELATÓRIO TÉCNICO SUBMETIDO AO CORPO DE AVALIAÇÃO DA PETROBRAS, COMO PARTE INTEGRANTE DAS ATIVIDADES DE PESQUISA, DESENVOLVIMENTO E INOVAÇÃO REFERENTES AO PROJETO SUPRACITADO. \\
  }
  \newcommand\frontpage@bottomtext{%
    \begin{center}
    {\MakeUppercase{\local@cityname, \local@statename\ -- \local@countryname}}\par
    {\MakeUppercase\local@monthname\ DE \number\year}
    \end{center}%
  }
  \newcommand\abstract@toptext{%
    \noindent Resumo do relatório apresentado
  }
  \newcommand\foreignabstract@toptext{%
    \noindent Resume
  }
\fi
\newcommand\local@advisorstring{Coordenador}
\newcommand\foreign@advisorstring{Coordinator}
\ifthenelse{\boolean{maledoc}}{%
  \newcommand\local@approvedname{Examinado por}%
}{%
  \newcommand\local@approvedname{Examinada por}%
}
\newcommand\local@universityname{Universidade Federal do Rio de Janeiro}
\newcommand\local@deptstring{Programa}
\newcommand\foreign@deptstring{Department}
\newcommand\local@cityname{Rio de Janeiro}
\newcommand\local@statename{RJ}
\newcommand\local@countryname{Brasil}
\newcommand\frontcover@maintext{
  \sloppy\nohyphens{\local@doctype\ de \@degreename\
  \ifthenelse{\boolean{maledoc}}{apresentado}{apresentada}
  ao Programa de P{\' o}s-gradua{\c c}{\~ a}o em \local@deptname,
  COPPE, da \local@universityname, como parte dos requisitos
  necess{\' a}rios {\` a} obten{\c c}{\~ a}o do t{\' i}tulo de
  \local@degname\ em \local@deptname.}
}


\newcommand{\annex}{
    \iflanguage{brazilian}
        {\renewcommand{\appendixname}{Anexo}}
        {\renewcommand{\appendixname}{Annex}}
    \appendix
}
