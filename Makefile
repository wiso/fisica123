# ancora sperimentale

NAME	= fisica
MAIN_SOURCE	= $(NAME).tex
OUTDVI  = $(NAME).dvi
OUTPDF	= $(NAME).pdf
IST	= $(NAME).ist
IND	= $(NAME).ind
IDX	= $(NAME).idx
BBL	= $(NAME).bbl
TEXS	= $(wildcard TeX/*.tex)

LATEX	= latex
PDFLATEX = pdflatex -shell-escape
BIBTEX	= bibtex
MAKEINDEX = makeindex


pdf:	pdf_images $(MAIN_SOURCE) $(IND) $(OUTPDF)

dvi:	eps_images $(MAIN_SOURCE) $(IND) $(OUTDVI)

images: pdf_images eps_images

pdf_images:
	@$(MAKE) -C immagini pdf_images

eps_images:
	@$(MAKE) -C immagini eps_images

$(OUTPDF):	$(MAIN_SOURCE) $(IND) $(TEXS)
	$(PDFLATEX) $(MAIN_SOURCE)
	@while (grep "Rerun to get cross-references" $(NAME).log > /dev/null ); do echo '** Re-running LaTeX **'; $(PDFLATEX) $(MAIN_SOURCE); done

$(OUTDVI):	$(MAIN_SOURCE) $(IND) $(TEXS)
	$(LATEX) $(MAIN_SOURCE)

$(IND):	
	@echo ************************
	@echo     creazione indice
	@echo ************************
	$(PDFLATEX) $(MAIN_SOURCE)
	$(MAKEINDEX) $(IDX)
#TODO: PDFLATEX / LATEX

$(BBL): $(TEXSRC) $(BIBSRC)
	$(LATEX) $(TARGET).tex
	$(BIBTEX) $(TARGET)

clean:
	rm -f *.aux fisica.ilg fisica.ind fisica.lof fisica.log fisica.lot fisica.toc *.tex~ TeX/*.tex~ TeX/*.aux TeX/*.backup TeX/*.bak fisica.out fisica.blg fisica.idx
	cat fisica.maf|xargs rm -f
	rm -f fisica.maf
	rm -f *.backup

tar:	
	clean
	tar cfv fisica.tar fisica; mv fisica.tar fisica; gzip fisica.tar
