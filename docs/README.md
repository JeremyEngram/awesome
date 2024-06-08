

<p align="center">
<a href="https://github.com/sponsors/jeremyengram" target="_blank"><img src="https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86" height="25"></a>
<a href="https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps" target="_blank"><img src="https://img.shields.io/badge/PWA-enabled-brightgreen" alt="PWA Shield" height="25"></a>
<a href="https://twitter.com/jeremyengram" rel="nofollow" target="_blank"><img src="https://img.shields.io/badge/created%20by-@jeremyengram-4BBAAB.svg" alt="Created by Shin Okada" height="25"></a>
<a href="https://opensource.org/licenses/MIT" rel="nofollow" target="_blank"><img src="https://img.shields.io/github/license/jeremyengram/omnihub" alt="License" height="25"></a>
</p>

<h1  align="center">OmniHub - A Simple Shell Script Package Manager For Omniscient</h1>
<p align="center">
<img width="400" src="https://raw.githubusercontent.com/jeremyengram/omnihub/main/images/omnihubsky-o.gif" />
</p>

[Read more about OmniHub Package Manager](https://medium.com/mkdir-omnihub/a-new-simple-package-manager-for-script-languages-a1228fd0972a)

## Overview

The `omnihub` is a simple shell script package manager. omnihub installs a shell script package from a GitHub repo on your Linux base system as a standalone installer managemment hub for OSINT and Digital Forensics repository management with pre-defined constraints.

 It creates the `~/.local/share/omnihub` directory and the `~/.local/share/bin` directory if they don't exist. When you install a package, it will clone it in the `~/.local/share/omnihub` directory. It creates a symlink in the `~/.local/share/bin` directory.

 Use `omnihub push <message>` to run Git commands and omnihub update.

## Why?

- Some scripts don't have Homebrew installation. (macOS/Linux)
- Make an easy installation.

## Requirements

UNIX-lie (Tested on Ubuntu and MacOS.)

## Installation

Installing omnihub:

```sh
curl -s https://raw.githubusercontent.com/jeremyengram/omnihub/main/install | bash -s install
```

or

```sh
wget -qO - https://raw.githubusercontent.com/jeremyengram/omnihub/main/install | bash -s install
```

Add the following to your terminal config file, such as .zshrc or .bashrc.

```sh
export PATH=$HOME/.local/share/bin:$PATH
```

Then source the config file or open a new terminal tab.

```sh
# for example
. ~/.zshrc
```

## Uninstallation

Uninstalling omnihub:

```sh
curl -s https://raw.githubusercontent.com/jeremyengram/omnihub/main/install > tmp1 && bash tmp1 uninstall && rm tmp1
```

or

```sh
wget -qO - https://raw.githubusercontent.com/jeremyengram/omnihub/main/install > tmp1 && bash tmp1 uninstall && rm tmp1
```

## Update omnihub

Update omnihub:

```sh
omnihub update omnihub
```

## Usage

```sh
install  installs a package from a GitHub repo and create a symlink in ~/bin
rm       uninstalls a package and remove a symlink
ls       lists omnihub packages
link     adds a symlink
unlink   remove a package symlink
links    prints all links
update   checks an update and install a new package
push     Git add, commit, push, and update the script you are working
alias    creates an alias
url      opens omnihub repo on a browser
```

## Options

```sh
-v | --version prints version
-h, --help     prints this help message and exit
```

You can use different ways installing scripts.

```sh
# Installing a repo using user/repo
omnihub install jeremyengram/gitstart

# Installing a repo using user/repo.git
omnihub install jeremyengram/gitstart.git

# Installing a repo whose main script is different from the repo name
omnihub install raylee/tldr-sh-client tldr

# Same as above but using https
omnihub install https://github.com/jeremyengram/cleanit

omnihub install https://github.com/raylee/tldr-sh-client tldr

# Installing a repo using install option instead of -i
omnihub install https://github.com/jeremyengram/gitstart.git
```

To install scripts from [Bash snippets](https://github.com/alexanderepstein/Bash-Snippets):

```sh
omnihub install alexanderepstein/Bash-Snippets cheat/cheat
# add more script
omnihub install alexanderepstein/Bash-Snippets movies/movies
```

## Remove a symlink and repo

```sh
omnihub rm cleanit
```

## Show installed packages

```sh
omnihub ls
```

## Update a repo

```sh
omnihub update cleanit
```

## Git add, commit, push, and update

When you are working on a script, you need to run a bunch of Git commands and update the local package. Use `push`:

```sh
omnihub push "your commit message"
```

This will run Git add, commit, push, and omnihub update commands.


## Open a omnihub URL page

```sh
omnihub url
```

## Print help

```sh
omnihub --help
omnihub -h
```

## Print version

```sh
omnihub --version
omnihub -v
```

## What should I do when a repo has multiple scripts

Alias is useful when a repo has multiple scripts.

Let's add aliases using [script-examples](https://github.com/jeremyengram/script-examples)

Install it using php-example.php as the main script.

```sh
omnihub install jeremyengram/script-examples php-example.php
```

Run it:

```sh
php-example.php
Hello world from PHP!%
```

The script-examples has multiple scripts in different languages.
Let's add an alias to node-example.js using `alias ne`, where `ne` is an alias name:

```sh
# Create an alias to a different script
omnihub alias ne script-examples node-example.js
```

Run it:

```sh
ne
Hello World! from Node.
```

You can try it for `perl-example.pl`, `python-example.py`, `ruby-example.rb`.

## Some libraries you can install

| Name                                                              | Installation                            | Description                                                                                 |
| ----------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------------------------------------------- |
| [tldr](https://github.com/raylee/tldr-sh-client)                  | omnihub -i raylee/tldr-sh-client tldr   | a collection of community-maintained help pages for command-line tools                      |
| [has](https://github.com/kdabir/has)                              | omnihub -i kdabir/has                   | Helps you to check the presence of various command line tools and their versions on a path. |
| [ddgr](https://github.com/jarun/ddgr)                             | omnihub -i jarun/ddgr                   | DuckDuckGo from the terminal.                                                               |
| [desk](https://github.com/jamesob/desk)                           | omnihub -i jamesob/desk                 | Lightweight workspace manager for the shell.                                                |
| [gitstart](https://github.com/jeremyengram/gitstart)                 | omnihub -i jeremyengram/gitstart           | GitHub repository automation.                                                               |
| [gitig](https://github.com/jeremyengram/gitig)                       | omnihub -i jeremyengram/gitig              | Fix a gitignore problem.                                                                    |
| [googler](https://github.com/jarun/googler)                       | omnihub -i jarun/googler                | Google Search, Google Site Search, Google News from the terminal.                           |
| [hhighlighter](https://github.com/paoloantinori/hhighlighter)     | omnihub -i paoloantinori/hhighlighter h | Colorize words in a command output.                                                         |
| [backpack_install](https://github.com/jeremyengram/backpack_install) | omnihub -i jeremyengram/backpack_install   | Backpack for Laravel installer.                                                             |
| [hr](https://github.com/paoloantinori/hhighlighter)               | omnihub -i LuRsT/hr                     | A horizontal ruler for your terminal.                                                       |
| [manop](https://github.com/jeremyengram/manop)                       | omnihub -i jeremyengram/manop              | Man page description and option viewer.                                                     |
| [shml](https://github.com/odb/shml)                               | omnihub -i odb/shml shml.sh             | A shell framework for faster and easier script development.                                 |
| [slugify](https://github.com/benlinton/slugify)                   | omnihub -i benlinton/slugify            | A bash command that converts filenames and directories to a web friendly format.            |
| [spark](https://github.com/holman/spark)                          | omnihub -i holman/spark                 | ▁▂▃▅▂▇ in your shell.                                                                       |
| [spot](https://github.com/rauchg/spot)                            | omnihub -i rauchg/spot                  | Tiny file search utility.                                                                   |
| [v](https://github.com/rupa/v)                                    | omnihub -i rupa/v                       | z for vim.                                                                                  |
| [ansiweather](https://github.com/fcambus/ansiweather)             | omnihub -i fcambus/ansiweather          | Display the current weather conditions.                                                     |


You can use more than 20 scripts from [Bash Snippets](https://github.com/alexanderepstein/Bash-Snippets).

## How to create a script for omnihub

- Add a shebang for example `#!/usr/bin/env bash` at the beginning.
- Recommend use a file name without `.sh` file extension for the main script
- Recommend to have the same repo and main script name. e.g. `jeremyengram/gitstart` has `gitstart`.
- Add `-h| --help` option.
- Your command starts with your main script name.

## Test

Run:

```sh
shellspec -s bash
```

## Author

@jeremyengram

## PWA: Fast & Offline

This website can be downloaded and installed on your device for offline access as a Progressive Web App.

To install a PWA, look for the "Add to Home Screen" option in the browser's menu or settings. On most mobile devices, this option can be found by visiting the website, then selecting the "Options" or "Menu" button in the browser, and looking for the "Add to Home Screen" option. On some desktop browsers, right-click on the page and select "Install".

## License

MIT License

Copyright (c) 2021 Shinichi Okada

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

