# Template de Relatório do LPS

Este repositório contém o modelo (template) em LaTeX para a elaboração de relatórios técnicos e de acompanhamento de projetos do Laboratório de Processamento de Sinais (LPS) da COPPE/UFRJ. O template foi desenvolvido para padronizar e facilitar a compilação de documentos do laboratório.

## Estrutura do Repositório

O projeto está organizado com a seguinte estrutura de arquivos e diretórios principais:

* **`main.tex`**: Arquivo principal do documento LaTeX, responsável por coordenar a estrutura global, incluindo metadados, capítulos e referências bibliográficas.
* **`metadatas/`**: Diretório contendo arquivos de configuração e dados específicos do relatório:
  * `infos.tex`: Informações cadastrais do projeto, tais como título, coordenadores, participantes (professores, pesquisadores, discentes de pós-graduação e graduação) e laboratórios parceiros.
  * `packages.tex`: Inclusão e configuração de pacotes adicionais do LaTeX.
  * `abreviations.tex`: Definições de siglas, abreviações e símbolos utilizados no texto.
  * `bibliography.bib`: Arquivo contendo as referências bibliográficas no formato BibTeX.
* **`chapters/`**: Pasta destinada aos capítulos do relatório. Por exemplo, `chapters/chapter_01/main.tex` contém o conteúdo do primeiro capítulo.
* **`template/`**: Arquivos de classe do LaTeX (`coppe.cls`), arquivos BST de estilos bibliográficos e imagens de logotipos oficiais.
* **`Makefile`**: Script de automação de compilação.

## Instruções de Compilação

A compilação do relatório pode ser realizada por meio do utilitário `make` via linha de comando. Recomenda-se possuir uma distribuição LaTeX (como TeX Live ou MacTeX) previamente instalada e configurada no PATH do seu sistema operacional.

### Compilar o Relatório

Para efetuar a compilação completa do documento LaTeX e gerar o arquivo PDF final, execute o seguinte comando no diretório raiz do repositório:

```bash
make
```

Este comando aciona a sequência apropriada de ferramentas (`pdflatex`, `makeindex` para listas de siglas e símbolos, `bibtex` para referências e novas chamadas ao `pdflatex` para resolução de referências cruzadas), gerando o arquivo `main.pdf`.

### Limpar Arquivos Temporários

Durante o processo de compilação, diversos arquivos auxiliares são criados (por exemplo, `.aux`, `.log`, `.toc`, `.lof`, `.lot`). Para excluir todos os arquivos temporários e o arquivo PDF compilado, mantendo a estrutura do diretório limpa, execute:

```bash
make clean
```

## Customização de Informações

Para adaptar o relatório com os dados específicos de seu projeto e equipe, edite o arquivo [infos.tex](file:///Users/jodafons/Desktop/codes/latex-report-template/metadatas/infos.tex), preenchendo as macros de título, vigência, código de convênio, equipe executora e laboratórios associados.
