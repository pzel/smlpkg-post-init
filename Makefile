PREFIX := /usr/local/bin

.PHONY: install
install:
	ln -s $(shell pwd)/smlpkg-post-init $(PREFIX)/smlpkg-post-init
	chmod +x $(PREFIX)/smlpkg-post-init

.PHONY: check
check:
	shellcheck ./smlpkg-post-init
