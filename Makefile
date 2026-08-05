PDFLATEX = /Library/TeX/texbin/pdflatex -interaction=nonstopmode
MAKEINDEX = /Library/TeX/texbin/makeindex
BIBTEX = /Library/TeX/texbin/bibtex

TEX_FILE = main

all: $(TEX_FILE).pdf

$(TEX_FILE).pdf: $(TEX_FILE).tex
	-$(PDFLATEX) $(TEX_FILE).tex
	-$(MAKEINDEX) $(TEX_FILE).syx -s nomenclature.ist -o $(TEX_FILE).los
	-$(MAKEINDEX) $(TEX_FILE).abx -s nomenclature.ist -o $(TEX_FILE).lab
	-$(BIBTEX) $(TEX_FILE)
	-$(PDFLATEX) $(TEX_FILE).tex
	$(PDFLATEX) $(TEX_FILE).tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.nlo *.nls *.ilg $(TEX_FILE).pdf

.PHONY: all clean
