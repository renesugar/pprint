.PHONY: all clean doc test

OCAMLBUILD := ocamlbuild -use-ocamlfind -cflags "-g" -lflags "-g" -classic-display
MAIN       := PPrintTest

all:
	$(OCAMLBUILD) $(MAIN).native

clean:
	rm -f *~ $(MAIN).native
	rm -rf html
	$(OCAMLBUILD) -clean

doc: all
	@rm -rf html
	@mkdir html
	ocamlfind ocamldoc \
	  -html \
	  -I _build \
	  -d html \
	  -charset utf8 \
	  PPrintRenderer.ml *.mli PPrint.ml

test: all
	./$(MAIN).native
