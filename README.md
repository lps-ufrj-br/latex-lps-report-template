# LPS Report Template

This repository contains the LaTeX template for preparing technical and project progress reports for the Signal Processing Laboratory (LPS) of COPPE/UFRJ. The template was designed to standardize and simplify the compilation of the laboratory's documents.

## Repository Structure

The project is organized with the following main directory and file structure:

* **`main.tex`**: The main LaTeX document file, responsible for coordinating the overall structure, including metadata, chapters, and bibliographic references.
* **`metadatas/`**: Directory containing configuration files and report-specific data:
  * `infos.tex`: Project registration information, such as title, coordinators, participants (professors, researchers, graduate and undergraduate students), and partner laboratories.
  * `packages.tex`: Inclusion and configuration of additional LaTeX packages.
  * `abreviations.tex`: Definitions of acronyms, abbreviations, and symbols used throughout the text.
  * `bibliography.bib`: BibTeX file containing bibliographic references.
* **`chapters/`**: Directory intended for report chapters. For example, `chapters/chapter_01/main.tex` contains the content of the first chapter.
* **`template/`**: LaTeX class files (`coppe.cls`), BST bibliographic style files, and official logo images.
* **`Makefile`**: Compilation automation script.

## Compilation Instructions

The report is compiled using a Docker container, meaning you only need Docker installed on your system—no local LaTeX distribution (such as TeX Live or MacTeX) is required.

### Compile the Report

To compile the LaTeX document and generate the final PDF file, run:

```bash
make
```

This command will:
1. Automatically build a local Docker image (`latex-lps-report`) containing the LaTeX environment (if it hasn't been built yet or if the `Dockerfile` has changed).
2. Run the compilation sequence (`pdflatex`, `makeindex` for abbreviations and symbols, `bibtex` for references) inside the Docker container.
3. Automatically clean up the workspace area, removing intermediate auxiliary files while keeping the compiled PDF (`main.pdf`).

### Clean Temporary Files

To clean up all intermediate files and delete the compiled PDF, execute:

```bash
make clean
```

### Clean Workspace Manually (Keep PDF)

If you need to manually clean the workspace but keep the compiled PDF, run:

```bash
make clean_but_keep_pdf
```

## Information Customization

To adapt the report with the specific data of your project and team, edit the file [infos.tex](file:///Users/jodafons/Desktop/codes/latex-report-template/metadatas/infos.tex), filling in the macros for title, duration, agreement code, project team, and associated laboratories.
