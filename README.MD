# MY DEFAULT CONFIG

## Getting Started

### Prerequisites
* A Unix-like operating system: macOS, Linux, BSD. On Windows: WSL is preferred, but cygwin or msys also mostly work.
* [Zsh](https://www.zsh.org) should be installed (v4.3.9 or more recent). If not pre-installed (run `zsh --version` to confirm), check the following instructions here: [Installing ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
* `git` should be installed

### Repo installation
Clone the repo in your `~/` directory
 - run `git clone https://github.com/NicolasBernaux/my-config.git`

Create .zshrc with your mac user name
 - run `make user="YOUR_USER_NAME" create-zshrc`

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
 - run `make install-oh-my-zsh`

Install plugins
 - run `make get-plugins`

Install themes
 - run `make get-themes`


#### Then enjoy