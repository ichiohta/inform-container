SRCDIR = src
BUILDDIR = build

all: hello6 hellop

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)

# ---------------------------------------------------------------------- Standard Inform 6 Sample

IINFORM6_STANDARD_LIBPATH = /usr/local/share/inform6/lib

hello6: $(BUILDDIR)/hello6.gblorb

$(BUILDDIR)/hello6.gblorb: $(BUILDDIR)/hello6.ulx hello6.blurb
	inblorb hello6.blurb $(BUILDDIR)/hello6.gblorb

$(BUILDDIR)/hello6.ulx: $(SRCDIR)/hello6.inf | $(BUILDDIR)
	inform6 -G +include_path=$(IINFORM6_STANDARD_LIBPATH) $(SRCDIR)/hello6.inf $(BUILDDIR)/hello6.ulx

# ---------------------------------------------------------------------- Puny Inform Sample

hellop: $(BUILDDIR)/hellop.z3 $(BUILDDIR)/hellop.d64

PUNYINFORM_LIBPATH=/usr/local/share/PunyInform/lib

$(BUILDDIR)/hellop.z3: $(SRCDIR)/hellop.inf | $(BUILDDIR)
	inform6 -v3 +include_path=$(PUNYINFORM_LIBPATH) $(SRCDIR)/hellop.inf $(BUILDDIR)/hellop.z3

$(BUILDDIR)/hellop.d64: $(BUILDDIR)/hellop.z3 | $(BUILDDIR)
	ruby /usr/local/share/ozmoo/make.rb -t:c64 -ss1:"Hello World" -ss2:"Interactive Fiction" -ss3:"By You" -sw:6 -dm:0 $(BUILDDIR)/hellop.z3
	mv c64_hellop.d64 $(BUILDDIR)/hellop.d64

