#! /bin/bash

# ./build_tex.sh DIR
build_tex(){
    cd $1
    pdflatex -synctex=1 -interaction=nonstopmode main.tex
    bibtex main
    pdflatex -synctex=1 -interaction=nonstopmode main.tex
    pdflatex -synctex=1 -interaction=nonstopmode main.tex
    cd "$OLDPWD"
}

# apply_perl $command $file
apply_perl(){
    echo "$1"
    perl -pe "${1}" $2 > /tmp/tmp.tex
	cp /tmp/tmp.tex $2
}

# apply_perl $list_commands
remove_environments(){
    # echo "apply_perl '\$/ = \"\"; s/\\begin{$1}.*?\\end{$1}//sgm' $2"
    argc=$#
    argv=("$@")
    for (( j=1; j<argc; j++ )); do
        apply_perl "$/ = undef; s/\\\\begin{${argv[j]}}.*?\\\\end{${argv[j]}}//sgm" $1
#        echo "${argv[j]}"
    done
}


$*