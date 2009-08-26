# ancora sperimentale

NAME	= fisica_linux
MAIN_SOURCE	= $(NAME).tex
OUTDVI  = $(NAME).dvi
OUTPDF	= $(NAME).pdf
IST	= $(NAME).ist
IND	= $(NAME).ind
IDX	= $(NAME).idx
BBL	= $(NAME).bbl
TEXS	= $(wildcard TeX/*.tex)

LATEX	= latex
PDFLATEX = pdflatex
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
	echo ************************
	echo     creazione indice
	echo ************************
	$(PDFLATEX) $(MAIN_SOURCE)
	$(MAKEINDEX) $(IDX)
#TODO: PDFLATEX / LATEX

$(BBL): $(TEXSRC) $(BIBSRC)
	$(LATEX) $(TARGET).tex
	$(BIBTEX) $(TARGET)

clean:
	rm -f *.aux fisica_linux.ilg fisica_linux.ind fisica_linux.lof fisica_linux.log fisica_linux.lot fisica_linux.toc *.tex~ TeX/*.tex~ TeX/*.aux TeX/*.backup TeX/*.bak fisica_linux.out fisica_linux.blg fisica_linux.idx
	cat fisica_linux.maf|xargs rm -f
	rm -f fisica_linux.maf
	rm -f *.backup

tar:	
	clean
	tar cfv fisica_linux.tar fisica; mv fisica_linux.tar fisica; gzip fisica_linux.tar
