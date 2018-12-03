MAIN =  rmd-intro.html


all: $(MAIN)

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^')"

.PHONY: clean copy show

copy: $(MAIN)
	cp $(MAIN) ~/txt/hugo/bd2/static/talks/2018/
	cp -r simplesteps_files ~/txt/hugo/bd2/static/talks/2018/
	deploy.sh

## Making pdf version of slides takes a few seconds.
## following webshot advice on
## https://github.com/wch/webshot
## in particular, install_phantomjs() first.
## Another approach is to use the pagedown package
## https://github.com/rstudio/pagedown
##rmd-intro.pdf: rmd-intro.html
##	Rscript -e "webshot::webshot('$^', '$@')"
##	cp $@ ~/txt/hugo/bd2/static/talks/2018/

rmd-intro.pdf: rmd-intro.html
	#`npm bin`/decktape   --chrome-arg=--allow-file-access-from-files $^ $@

## convert first page e.g. for making tweet of slides.
rmd-intro.png: rmd-intro.pdf
	convert rmd-intro.pdf[0] rmd-intro.png

copy2: $(MAIN)
	scp $(MAIN) sje30@mea:web
	scp -r simplesteps_files sje30@mea:web

# The sed lines are required to ensure that the css are refreshed, I don't know why!
# The sed lines work on mac and unix, BUT assume they won't match the first line.
# Maybe also we don't need the hack, but just need to periodically restart browser?


clean:
	rm -f $(MAIN) 

show: $(MAIN)
	open $(MAIN)
