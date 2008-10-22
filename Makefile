# sperimentale
NAME	= fisica_linux 
SOURCE	= fisica_linux.tex
OUTDVI  = $(SOURCE:.tex=.dvi)
OUTPDF	= $(SOURCE:.tex=.pdf)
IST	= $(SOURCE:.tex=.ist)
IND	= $(SOURCE:.tex=.ind)
IDX	= $(SOURCE:.tex=.idx)


dvi:	$(SOURCE) $(IND) $(OUTDVI)

pdf:	$(SOURCE) $(IND) $(OUTPDF)

$(OUTPDF):	$(SOURCE) $(IND)
	pdflatex $(SOURCE)

$(OUTDVI):	$(SOURCE) $(IND)
	latex $(SOURCE)

$(IND):	$(IST)
	echo ************************
	echo     creazione indice
	echo ************************
	latex $(SOURCE)
	makeindex -s $(IST) $(IDX)

clean:
	rm -f *.aux fisica_linux.ilg fisica_linux.ind fisica_linux.lof fisica_linux.log fisica_linux.lot fisica_linux.toc

tar:	
	clean
	tar cfv fisica_linux.tar fisica; mv fisica_linux.tar fisica; gzip fisica_linux.tar