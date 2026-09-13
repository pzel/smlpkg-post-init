PREFIX := /usr/local/bin

.PHONY: install
install:
	ln -s $(shell pwd)/smlpkg-post-init $(PREFIX)/smlpkg-post-init
	chmod +x $(PREFIX)/smlpkg-post-init

.PHONY: check
check:
	shellcheck ./smlpkg-post-init


example: smlpkg-post-init
	(rm -rf $@\
	&& mkdir $@\
	&& cd $@\
	&& smlpkg init github.com/example-user/example-project\
	&& smlpkg-post-init)

