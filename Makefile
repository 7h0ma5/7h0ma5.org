preview: site
	./site preview

clean: site
	./site clean

site: site.hs
	ghc --make -dynamic site.hs
