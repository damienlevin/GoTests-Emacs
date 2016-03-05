# GoTests-Emacs [![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/cweill/GoTests-Sublime/blob/master/LICENSE)

`GoTests-Emacs` is a package for Emacs for automatically generating [table driven tests](https://github.com/golang/go/wiki/TableDrivenTests). It uses [`gotests`](https://github.com/cweill/gotests) to generate missing tests based on its target source files' function and method signatures. Any new dependencies in the test files are automatically imported.

## Demo

![demo](/gotests.gif)

## Installation

__Prequisite:__ Use [`go get`](https://golang.org/cmd/go/#hdr-Download_and_install_packages_and_dependencies) to install and update the `gotests` tool:
```sh
$ go get -u github.com/cweill/gotests/...
```

Next, copy GoTests-Emacs in your .emacs directory
```
cd ~/.emacs.d
wget https://raw.githubusercontent.com/damienlevin/GoTests-Emacs/master/gotests.el
```
In your .emacs add the following:
```
;; gotests
(add-to-list 'load-path "~/.emacs.d/")
(require 'gotests)
```

## Usage

Select some functions and run `M-x gotests-region`. This appends missing tests to an existing test file, or creates a new test file with them. To generate all missing tests use `M-x gotests`

## License

`GoTests-Emacs` is released under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).
