update:
	# should go into /usr/share/texlive/texmf-local/tex/latex/yliow
	-mkdir latex
	cp -r /usr/share/texlive/texmf-local/tex/latex/yliow latex

	# should go into /usr/lib/python*.*/site-packages
	-mkdir python
	cp -r /home/student/shares/yliow/Documents/work/projects/latextool/latextool_basic.py python/
	cp -r /home/student/shares/yliow/Documents/work/projects/latextool/latexcircuit.py python/
	cp -r /home/student/shares/yliow/Documents/work/projects/latextool/data python/
	cp -r /home/student/shares/yliow/Documents/work/projects/makemake/makemake.py python/
