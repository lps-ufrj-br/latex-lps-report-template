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

The report can be compiled using the `make` utility via command line. It is recommended to have a LaTeX distribution (such as TeX Live or MacTeX) installed and configured in your system's PATH.

### Compile the Report

To perform a complete compilation of the LaTeX document and generate the final PDF file, run the following command in the root directory of the repository:

```bash
make
```

This command triggers the appropriate sequence of tools (`pdflatex`, `makeindex` for lists of abbreviations and symbols, `bibtex` for references, and subsequent calls to `pdflatex` to resolve cross-references), generating the `main.pdf` file.

### Clean Temporary Files

During the compilation process, several auxiliary files are created (e.g., `.aux`, `.log`, `.toc`, `.lof`, `.lot`). To delete all temporary files and the compiled PDF, keeping the directory structure clean, execute:

```bash
make clean
```

## Information Customization

To adapt the report with the specific data of your project and team, edit the file [infos.tex](file:///Users/jodafons/Desktop/codes/latex-report-template/metadatas/infos.tex), filling in the macros for title, duration, agreement code, project team, and associated laboratories.
