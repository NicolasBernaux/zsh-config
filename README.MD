# MY DEFAULT CONFIG
A lightweight config to configure your terminal in 1 minute using [spaceship prompt](https://github.com/maximbaz/spaceship-prompt.git) 🚀.
![spaceship prompt](https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif "Spaceship prompt")

## Getting Started

### Prerequisites
- [Zsh](https://www.zsh.org) should be installed (v4.3.9 or more recent). If not pre-installed (run `zsh --version` to confirm), check the following instructions here: [Installing ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- `git` should be installed

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

Set global gitignore
 - run `make set-global-gitignore`



### Dependencies
 - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
 - [spaceship async prompt](https://github.com/maximbaz/spaceship-prompt.git)
 - [symfony console](https://github.com/mnapoli/zsh-symfony-console-plugin.git)
 - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions.git)
 - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
 - [zsh-z](https://github.com/agkozak/zsh-z.git)