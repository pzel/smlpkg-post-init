PREFIX := /usr/local/bin

.PHONY: install
install:
	ln --force --symbolic $(shell pwd)/smlpkg-post-init $(PREFIX)/smlpkg-post-init
	ln --force --symbolic $(shell pwd)/polymlb-repl $(PREFIX)/polymlb-repl
	chmod +x $(PREFIX)/smlpkg-post-init
	chmod +x $(PREFIX)/polymlb-repl

.PHONY: check
check:
	shellcheck ./smlpkg-post-init
	shellcheck ./polymlb-repl
	$(MAKE) example && (cd example && make repl)


example: smlpkg-post-init
	(rm -rf $@\
	&& mkdir $@\
	&& cd $@\
	&& smlpkg init github.com/example-user/example-project\
	&& smlpkg-post-init)

