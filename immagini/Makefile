FIGS = $(wildcard *.fig) $(wildcard */*.fig)
SVGS = $(wildcard *.svg) $(wildcard */*.svg)
PDFS = $(FIGS:.fig=.pdf) $(SVGS:.svg=.pdf)
EPSS = $(FIGS:.fig=.eps) $(SVGS:.svg=.eps)

images: pdf eps

remove_pdf:
	rm $(PDFS) --force

remove_eps:
	rm $(EPSS) --force

pdf: $(PDFS)

eps: $(EPSS)

%.pdf: %.fig
	fig2dev -L pdf $< $@ 

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

%.eps: %.fig
	fig2dev -L eps $< $@

%.eps: %.svg
	inkscape --export-eps=$@ $<