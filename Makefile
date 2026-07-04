# ancora sperimentale

NAME	= fisica
MAIN_SOURCE	= $(NAME).tex

LATEXMK	= latexmk

pdf:	pdf_images
	$(LATEXMK) -pdf $(MAIN_SOURCE)

dvi:	eps_images
	$(LATEXMK) -dvi $(MAIN_SOURCE)

images: pdf_images eps_images

pdf_images:
	@$(MAKE) -C immagini pdf_images

eps_images:
	@$(MAKE) -C immagini eps_images

clean:
	cat fisica.maf 2>/dev/null | xargs rm -f
	rm -f fisica.maf
	$(LATEXMK) -c
	rm -f TeX/*.aux *.tex~ TeX/*.tex~ TeX/*.backup TeX/*.bak *.backup
	rm -f $(NAME)-figure*.* $(NAME).auxlock

tar:
	clean
	tar cfv fisica.tar fisica; mv fisica.tar fisica; gzip fisica.tar

.PHONY: pdf dvi images pdf_images eps_images clean tar
