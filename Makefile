filename=peter-senna-tschudin
makerunning=Make-running

all: pdf

pdf:
	touch ${makerunning}

	# Expecting latex_container_helper.sh to be on PATH and a symlink to cv-maker-container/docker/latex_container_helper.sh
	latex_container_helper.sh rubber -df ${filename} 

	rm -f ${makerunning}
	rm -f *.deleteme

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,brf,deleteme,gnt,ldl,lms,lrk,lse,ltk,lwp,mw,toc}
	rm -f *.aux

unlock:
	rm -f ${makerunning}
