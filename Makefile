html:
	LANG=C scripts/_generate_html

clean:
	rm -f scripts/BeautifulSoup.pyc
	rm -f text/*.log
	rm -f text/lpn-html.{4ct,4tc,css,idv,idx,lg,log,tmp,xref}

distclean:	clean
	rm -rf www/html
	rm -f text/chap*-*.ps
