##
# Commandes de personnalisation du terminal
##
.DEFAULT_GOAL := help

# Définition du nom d'utilisateur par défaut si non fourni (ex: make user=john init)
user ?= $(USER)

LOCALDATE := $(shell date +'%Y%m%d-%H%M')

.PHONY: get-packages create-zshrc get-oh-my-zsh get-themes get-plugins set-global-gitignore init help

get-packages: ## Installer les paquets de base (Brew, Node, Composer)
	@echo
	@printf '\033[35m 📦  Get Packages :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	@printf '\033[36m 📦  Install Homebrew :\033[0m\n'
	@command -v brew >/dev/null 2>&1 || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo
	@printf '\033[36m 📦  Install Node :\033[0m\n'
	@command -v node >/dev/null 2>&1 || brew install node
	@echo
	@printf '\033[36m 📦  Install Composer :\033[0m\n'
	@command -v composer >/dev/null 2>&1 || brew install composer
	@echo
	@printf '\033[92m 📦   Packages vérifiés/installés \033[0m\n'
	@echo

create-zshrc: ## Créer .zshrc à partir de .zshrc.example
	@echo
	@printf '\033[35m  🗂  Create .zshrc  :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	sed 's/USER_NAME/$(user)/g' .zshrc.example > .zshrc
	@echo
	@printf '\033[92m 🚀  .zshrc créé pour l'\''utilisateur : $(user) \033[0m\n'
	@echo

get-oh-my-zsh: ## Installer Oh My Zsh
	@echo
	@printf '\033[35m 📦  Get Oh My Zsh :\033[0m\n'
	@echo ----------------------------------------------------------------
	@if [ ! -d "./.oh-my-zsh/" ]; then \
		git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh; \
	fi
	@echo
	@printf '\033[92m 🚀  Oh My Zsh installé \033[0m\n'
	@echo

get-themes: ## Installer les thèmes Zsh
	@echo
	@printf '\033[35m 📦  Get Themes :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	@printf '\033[36m 📦  Install Spaceship Prompt :\033[0m\n'
	rm -rf .oh-my-zsh/custom/themes/spaceship-prompt .oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git .oh-my-zsh/custom/themes/spaceship-prompt --depth=1
	ln -s .oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme .oh-my-zsh/custom/themes/spaceship.zsh-theme
	@echo
	@printf '\033[92m 🎉  Thèmes installés \033[0m\n'
	@echo

get-plugins: ## Installer les plugins Zsh
	@echo
	@printf '\033[35m 📦  Get Plugins :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	@printf '\033[36m 📦  Install Zsh Symfony Console :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/symfony-console
	git clone https://github.com/mnapoli/zsh-symfony-console-plugin.git .oh-my-zsh/custom/plugins/symfony-console
	@echo
	@printf '\033[36m 📦  Install Zsh Autosuggestions :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions
	@echo
	@printf '\033[36m 📦  Install Zsh Syntax Highlighting :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	@echo
	@printf '\033[36m 📦  Install Zsh Z :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-z
	git clone https://github.com/agkozak/zsh-z.git .oh-my-zsh/custom/plugins/zsh-z
	@echo
	@printf '\033[36m 📦  Install Zsh Async :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/async
	git clone https://github.com/mafredri/zsh-async.git .oh-my-zsh/custom/plugins/async
	@echo
	@printf '\033[36m 📦  Install TheFuck :\033[0m\n'
	@command -v fuck >/dev/null 2>&1 || brew install thefuck
	@echo
	@printf '\033[92m 🎉  Plugins installés \033[0m\n'
	@echo

set-global-gitignore: ## Configurer un gitignore global
	@echo
	@printf '\033[35m 🙈  Set global gitignore :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	git config --global core.excludesfile ~/.gitignore_global
	@echo
	@printf '\033[92m 🎉  Global gitignore configuré \033[0m\n'
	@echo

init: get-packages create-zshrc get-oh-my-zsh get-themes get-plugins set-global-gitignore ## Initialiser tout l'environnement
	@printf '\033[1;93m  🚀  Tout est prêt ! 🚀\033[0m\n'
	@echo

help: ## Afficher cette aide
	@echo
	@printf '\033[34mCommandes disponibles :\033[0m\n'
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'
	@echo
