filename=peter-senna-tschudin
makerunning=Make-running

all: pdf read

pdf:
	#pdflatex ${filename}.tex
	touch ${makerunning}
	#rubber -df ${filename}
	./docker/do_build.sh rubber -df ${filename}
	rm -f ${makerunning}
	rm -f *.deleteme

read:
	./read.sh ${filename}.pdf &> /dev/null &

aspell:
	for file in $$(ls *.tex); do \
		aspell --lang=en-US -t -c $$file; \
	done

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,brf,deleteme,gnt,ldl,lms,lrk,lse,ltk,lwp,mw,toc}
	rm -f *.aux

unlock:
	rm -f ${makerunning}
