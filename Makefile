EINHEITEN = einheit01 \
			einheit02 \
			einheit03
#TEX_FILES := $(wildcard *.tex)
SRC = einheit01/einheit01
#FIGDIR = figures
RUBBER = rubber --inplace -m xelatex

#TODO: alle einheiten, einheiten separat ausfuehrbar, skripte mit einbauen.
FIGURES = `find $(FIGDIR) -name "*" | grep -v "~"`

.PHONY : clean 

## switches, build, clean et.
all : $(EINHEITEN) $(FILE).pdf

% : %/%.aux
	while grep 'Rerun to get ' $(FILE).log ; do \
	$(RUBBER) $(FILE) ; done
	while grep 'Citation(s) may have changed' $(FILE).log ; do \
	$(RUBBER) $(FILE) ; done

pdf :	$(FILE).tex $(SRC) $(BIB)
	rubber -m xelatex -m hyperref -m graphics 

xhtml : $(FILE).tex $(SRC) $(BIB)
	#bibtex aufrufen?
	htlatex $(FILE).tex "xhtml,jsmath,charset=utf-8" " -cunihtf -utf8" "-cvalidate"

%/%.aux : %/%.tex 
	$(RUBBER) %/%.tex

clean:
	#TODO:rekursiv
	rm -f  *.log *.bak *.aux *.bbl *.blg *.idx *.brf *.out *.nlo *.nls \
	*.ilg *.ind *.lof *.lot *.toc *~ 

#extractaufg : 

#convertslides : 

#zip:	clean
#	zip -9r dissertation.zip ../dissertation -x \*disputation\* \*ebib\* \*publishing\* \*.svn\* dissertation.zip
