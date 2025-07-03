.PHONY: dist

all:
	make tex dist

tex:
	./makefile_shell.sh build_tex .

dist:
	mkdir -p dist
	latexpand --empty-comments -o dist/main.tex main.tex
	bibexport -ns -o dist/main.bib main.aux
	cp lipics-logo-bw.pdf dist
	cp cc-by.pdf dist
	cp orcid.pdf dist
	cp lipics-v2021.cls dist
	cp dist/main.tex dist_main_pandonly.tex # for check
	# remove environments
	./makefile_shell.sh remove_environments dist/main.tex hidden yoshiki sideyoshiki
	# fix bibliography path
	./makefile_shell.sh apply_perl "s/\\\\bibliography\{(.*)\}/\\\\bibliography\{main\}/sgm" dist/main.tex
	# paper mode
	# ./makefile_shell.sh apply_perl "s/\\\\usepackage\[(.*)\]\{knowledge\}/\\\\usepackage\[\$${1},paper\]\{knowledge\}/sgm" dist/main.tex
	./makefile_shell.sh build_tex dist
