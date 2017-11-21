# Makefile for building documentation

default: html
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = build
# You can set these variables from the command line.
SRCDIR           := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
JULIAHOME        := $(abspath $(SRCDIR)/..)
MAKEFILE         := $(abspath $(SRCDIR)/make.jl)
JULIA_EXECUTABLE := $(shell ls /Applications/Julia*/Contents/Resources/julia/bin/julia)

.PHONY: help clean cleanall html pdf linkcheck doctest check deps deploy

help:
	@echo "  Please use 'make <target>' where <target> is one of"
	@echo "  html      to make standalone HTML files"
	@echo "  pdf       to make standalone PDF file"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation"
	@echo "  check     to run linkcheck and doctests"
	@echo $(SRCDIR)
	@echo $(JULIAHOME)
	@echo $(JULIA_EXECUTABLE)
	@echo $(MAKEFILE)

clean:
	-rm -rf _build/*

cleanall: clean

html: deps
	@echo "Building HTML documentation."
	$(Python --version)
	# $(JULIA_EXECUTABLE) $(MAKEFILE)
# ifneq ($(OS),WINNT)
# 	$(JULIA_EXECUTABLE) $(call cygpath_w,$(SRCDIR)/make.jl)
# else
# # work around issue #11727, windows output redirection breaking on buildbot
# 	$(JULIA_EXECUTABLE -e $(SRCDIR)/make.jl)
# endif
# 	@echo "Build finished. The HTML pages are in _build/html."