#
# Makefile used to ease the management of this site :)
#

all: site

clean:
	$(RM) -r _cache site

site: site.hs
	ghc --make site.hs

# update the blog with hakyll then deploy it to github pages
deploy-site: site
	./site build && cd _site && git add -u && git add -A . && ((git commit -m "update" && git push) || git push)

# update the source code to github (repository)
deploy-source:
	git add -u && git add -A . && ((git commit -m "update" && git push) || git push)

# deploy everything
lazy: deploy-site deploy-source

.PHONY: all clean deploy-site deploy-source lazy
