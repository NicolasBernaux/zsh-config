##
# Various helpful commands
##
.DEFAULT_GOAL := help

LOCALDATE := $(shell date +'%Y%m%d-%H%M')


.PHONY: get-packages
get-packages: ## Get packages
	@echo
	@printf '\033[35m 📦  Get Packages :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo

	@echo
	@printf '\033[36m 📦  Install Homebrew :\033[0m\n'
	# If brew -v return this will install brew
	brew -v || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Node :\033[0m\n'
	node -v || brew install node

	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Composer :\033[0m\n'
	composer -v || brew install composer

	@echo
	@printf '\033[92m 📦   Plugins installed \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: create-zshrc
create-zshrc: ## Create .zshrc from .zshrc.example
	@echo
	@printf '\033[35m  🗂  Create .zshrc  :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo

	sed 's/USER_NAME/$(user)/g' .zshrc.example > .zshrc

	@echo
	@printf '\033[92m 🚀  .zshrc created \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: get-oh-my-zsh
get-oh-my-zsh: ## Get oh my zsh
	@echo
	@printf '\033[35m 📦  Get Oh My Zsh :\033[0m\n'
	@echo ----------------------------------------------------------------

	@if [ ! -d "./.oh-my-zsh/" ]; then\
		git clone https://github.com/robbyrussell/oh-my-zsh.git ./.oh-my-zsh;\
	fi

	@echo
	@printf '\033[92m 🚀  Oh My Zsh installed \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: get-themes
get-themes: ## Get themes
	@echo
	@printf '\033[35m 📦  Get Themes :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo

	@printf '\033[36m 📦  Install Spaceship Prompt :\033[0m\n'
	rm -rf .oh-my-zsh/custom/themes/spaceship-prompt .oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/maximbaz/spaceship-prompt.git .oh-my-zsh/custom/themes/spaceship-prompt
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme


	@echo
	@printf '\033[92m 🎉  Themes installed \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: get-plugins
get-plugins: ## Get the differents plugins
	@echo
	@printf '\033[35m 📦  Get Plugins :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	
	
	@printf '\033[36m 📦  Install Zsh Symfony Console :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/symfony-console
	git clone https://github.com/mnapoli/zsh-symfony-console-plugin.git .oh-my-zsh/custom/plugins/symfony-console

	
	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Zsh Autosuggestions :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions


	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Zsh Syntax Highlighting :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Zsh Z :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/zsh-z
	git clone https://github.com/agkozak/zsh-z.git .oh-my-zsh/custom/plugins/zsh-z

	
	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install Zsh Async :\033[0m\n'
	rm -rf .oh-my-zsh/custom/plugins/async
	git clone https://github.com/mafredri/zsh-async.git .oh-my-zsh/custom/plugins/async

	
	@echo
	@echo
	@echo

	@printf '\033[36m 📦  Install TheFuck :\033[0m\n'
	fuck -v || brew install thefuck

	@echo
	@printf '\033[92m 🎉  Plugins installed \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: set-global-gitignore
set-global-gitignore: ## Set a global gitignore
	@echo
	@printf '\033[35m 🙈  Set global gitignore :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo

	git config --global core.excludesfile ~/.gitignore_global
	
	@echo
	@printf '\033[92m 🎉  Global gitignore set \033[0m\n'
	@echo
	@echo
	@echo



.PHONY: init
init: ## Create .zshrc from .zshrc.example
	@printf '\033[1;93m  🗂  Init :\033[0m\n'
	@echo ----------------------------------------------------------------
	@echo
	
	make get-packages
	make user=$(user) create-zshrc
	make get-oh-my-zsh
	make get-themes
	make get-plugins
	make set-global-gitignore


	@printf '\033[1;93m  🚀  You are ready 🚀\033[0m\n'
	@echo



.PHONY: help
help: ## Show a list of available commands
	@echo
	@printf '\033[34mAvailable commands:\033[0m\n'
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort |\
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo
