# Makefile for building documentation

default: html

SOURCEDIR     = src
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = build
# You can set these variables from the command line.
SRCDIR           := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
JULIAHOME        := $(abspath $(SRCDIR)/..)
MAKEFILE         := $(abspath $(SRCDIR)/make.jl)
JULIA_EXECUTABLE := $(shell ls /Applications/Julia*/Contents/Resources/julia/bin/julia)
$(shell export PATH=$($(shell ls /Applications/Julia*/Contents/Resources/julia/bin/):${PATH}))

# User-friendly check for sphinx-build
ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
$(error The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed, then set the SPHINXBUILD environment variable to point to the full path of the '$(SPHINXBUILD)' executable. Alternatively you can add the directory with the executable to your PATH. If you don't have Sphinx installed, grab it from http://sphinx-doc.org/)
endif

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: help clean cleanall html pdf linkcheck doctest check deps deploy

help:
	@echo $(SRCDIR)
	@echo $(JULIAHOME)
	@echo $(JULIA_EXECUTABLE)
	@echo $(MAKEFILE)
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  Please use 'make <target>' where <target> is one of"
	@echo "  html      to make standalone HTML files"
	@echo "  pdf       to make standalone PDF file"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation"
	@echo "  check     to run linkcheck and doctests"

.PHONY: clean
clean:
	-rm -rf build/*

.PHONY: default
html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	# $(shell ($(JULIA_EXECUTABLE) make.jl)) > docbuild.log 2>&1
	@echo
	@echo "Building HTML documentation."
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."
	# $(Python --version)
	# $(JULIA_EXECUTABLE) $(MAKEFILE)
	# JULIA_EXECUTABLE $(call cygpath_w,$(SRCDIR)/make.jl)

# ifneq ($(OS),WINNT)
# 	$(JULIA_EXECUTABLE) $(call cygpath_w,$(SRCDIR)/make.jl)
# else
# # work around issue #11727, windows output redirection breaking on buildbot
# 	$(JULIA_EXECUTABLE -e $(SRCDIR)/make.jl)
# endif
# 	@echo "Build finished. The HTML pages are in _build/html."