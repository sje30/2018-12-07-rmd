estimatek.html: estimatek.Rmd
	Rscript -e 'rmarkdown::render("estimatek.Rmd")'

estimatek.pdf: estimatek.Rmd
	Rscript -e 'rmarkdown::render("estimatek.Rmd", output_format=bookdown::pdf_book())'


.PHONY: clean

clean:
	rm -f estimatek.pdf estimatek.html
