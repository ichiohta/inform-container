LIBPATH = /usr/local/share/inform6/lib
SRCDIR = src
BUILDDIR = build

$(BUILDDIR)/hello.gblorb: $(BUILDDIR)/hello.ulx hello.blurb
	inblorb hello.blurb $(BUILDDIR)/hello.gblorb

$(BUILDDIR)/hello.ulx: $(SRCDIR)/hello.inf | $(BUILDDIR)
	inform6 -G +include_path=$(LIBPATH) $(SRCDIR)/hello.inf $(BUILDDIR)/hello.ulx

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)
