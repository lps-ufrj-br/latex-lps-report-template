IMAGE_NAME = latex-lps-report
DOCKER_RUN = docker run --rm -v $(shell pwd):/workdir -w /workdir $(IMAGE_NAME)

PDFLATEX = $(DOCKER_RUN) pdflatex -interaction=nonstopmode
MAKEINDEX = $(DOCKER_RUN) makeindex
BIBTEX = $(DOCKER_RUN) bibtex

TEX_FILE = main

.PHONY: all pdf clean clean_but_keep_pdf docker-build

all: pdf

docker-build:
	@if command -v docker > /dev/null 2>&1; then \
		docker build -t $(IMAGE_NAME) .; \
	else \
		echo "Error: docker is not installed." >&2; \
		exit 1; \
	fi

pdf: docker-build
	-$(PDFLATEX) $(TEX_FILE).tex
	-$(MAKEINDEX) $(TEX_FILE).syx -s nomenclature.ist -o $(TEX_FILE).los
	-$(MAKEINDEX) $(TEX_FILE).abx -s nomenclature.ist -o $(TEX_FILE).lab
	-$(BIBTEX) $(TEX_FILE)
	-$(PDFLATEX) $(TEX_FILE).tex
	$(PDFLATEX) $(TEX_FILE).tex || ( $(MAKE) clean_but_keep_pdf && exit 1 )
	$(MAKE) clean_but_keep_pdf

clean_but_keep_pdf:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.nlo *.nls *.ilg *.syx *.abx *.los *.lab

clean: clean_but_keep_pdf
	rm -f $(TEX_FILE).pdf
