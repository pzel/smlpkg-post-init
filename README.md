# smlpkg-post-init

This is a pure-sh script that sets up my 'opinionated' project structure for
[smlpkg](https://github.com/diku-dk/smlpkg)-enabled Standard ML projects.

Use it right after `smlpkg init somehub.com/me/myproject` to set up a directory
structure, a Makefile, .gitignore, and a failing test.

Works out-of-the-box with [polymlb](https://github.com/vqns/polymlb) and [mlton](http://mlton.org).

## Installation:

`sudo make install` will link this script to `/usr/local/bin/smlpkg-post-init`.

Please set `PREFIX` to another directory if you'd like to link it there.

```
make install PREFIX=/home/ubuntu/bin 
ln -s /home/ubuntu/code/smlpkg-post-init/smlpkg-post-init /home/ubuntu/bin/smlpkg-post-init
chmod +x /home/ubuntu/bin/smlpkg-post-init
```

It's just a shell script with no build steps.



## Usage:

```
17:45:09 example[_]% smlpkg init github.com/pzel/example
Created directory 'lib/github.com/pzel/example'.
Wrote sml.pkg.

17:45:16 example[_]% smlpkg-post-init 
Added new required package github.com/pzel/assert 0.10.0.
Remember to run 'smlpkg sync'.
Added new required package github.com/pzel/polyml-fill 0.1.0.
Remember to run 'smlpkg sync'.

17:45:29 example[_]% make test
polymlb -ann "ignoreFiles call-main.sml" -mlb-path-var "SMLPKG /data/p/code/example/lib" -mlb-path-var "POLY \$(SML_LIB)/basis/" -output bin/test lib/github.com/pzel/example/test/test.mlb
./bin/test

FAILED 
	left:  implement me
	right: ~explicit fail~


TESTS FAILED: 1/1

make: *** [Makefile:22: test] Error 1

17:45:58 example[_]% MLCOMP=mlton make test
mlton  -mlb-path-var "SMLPKG /data/p/code/example/lib" -mlb-path-var "POLY \$(SMLPKG)/github.com/pzel/polyml-fill/" -output bin/test lib/github.com/pzel/example/test/test.mlb
./bin/test

FAILED 
	left:  implement me
	right: ~explicit fail~


TESTS FAILED: 1/1

make: *** [Makefile:22: test] Error 1
```

## Example

See [the example directory](example) to see what the generated project looks like.
