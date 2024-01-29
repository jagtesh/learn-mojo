.PHONY: *

run:
	$(MAKE) all > /dev/null
	./test

all:
	gcc -shared -fPIC testlib.c -o testlib.dylib > /dev/null
	mojo build test.mojo