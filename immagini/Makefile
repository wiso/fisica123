FIGS = $(wildcard *.fig) $(wildcard */*.fig)
SVGS = $(wildcard *.svg) $(wildcard */*.svg)
PDFS = $(FIGS:.fig=.pdf) $(SVGS:.svg=.pdf)
EPSS = $(FIGS:.fig=.eps) $(SVGS:.svg=.eps)

images: pdf_images eps_images

remove_pdf_images:
	rm $(PDFS) --force

remove_eps_images:
	rm $(EPSS) --force

pdf_images: $(PDFS)

eps_images: $(EPSS)

%.pdf: %.fig
	fig2dev -L pdf $< $@ 

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

%.eps: %.fig
	fig2dev -L eps $< $@

%.eps: %.svg
	inkscape --export-eps=$@ $<