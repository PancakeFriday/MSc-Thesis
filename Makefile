

get_figures:
	cp /home/docker-manager/containers/jupyter/notebooks/msc-thesis/plots/*.tikz figures/
	cp /home/docker-manager/containers/jupyter/notebooks/msc-thesis/plots/*.pdf figures/

thesis_bib: clean get_figures
	xelatex Thesis
	biber Thesis
	xelatex Thesis
	xelatex Thesis

thesis: get_figures
	xelatex Thesis

clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
		*.inx *.ps *.dvi *.pdf *.toc *.out *.bcf *.run.xml
