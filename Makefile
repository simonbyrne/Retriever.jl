# Makefile for building documentation

default: help

SOURCEDIR     = src
SRCDIR           := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
JULIAHOME        := $(abspath $(SRCDIR)/..)
MAKEFILE         := $(abspath $(SRCDIR)/make.jl)
JULIA_EXECUTABLE := $(shell ls /Applications/Julia*/Contents/Resources/julia/bin/julia)

.PHONY: help clean cleanall html pdf linkcheck doctest check deps deploy


setupenv:
	$(shell export PATH=$($(shell ls /Applications/Julia*/Contents/Resources/julia/bin/):${PATH}))
	$(shell export PATH=$($(shell which python):${PATH}))
	@echo $(SRCDIR)
	@echo $(JULIAHOME)
	@echo $(JULIA_EXECUTABLE)
	@echo $(MAKEFILE)
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html      to make standalone HTML files"
	@echo "  pdf       to make standalone PDF file"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation"
	@echo "  check     to run linkcheck and doctests"

# .PHONY: clean
# clean:
# 	-rm -rf build/*

# .PHONY: defaultggg
# html:
# 	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
# 	# $(shell ($(JULIA_EXECUTABLE) make.jl)) > docbuild.log 2>&1
# 	@echo
# 	@echo "Building HTML documentation."
# 	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."
# 	# $(Python --version)
# 	# $(JULIA_EXECUTABLE) $(MAKEFILE)
# 	# JULIA_EXECUTABLE $(call cygpath_w,$(SRCDIR)/make.jl)

# # ifneq ($(OS),WINNT)
# # 	$(JULIA_EXECUTABLE) $(call cygpath_w,$(SRCDIR)/make.jl)
