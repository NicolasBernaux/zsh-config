##
# Various helpful commands
##
.DEFAULT_GOAL := help

LOCALDATE := $(shell date +'%Y%m%d-%H%M')


.PHONY: get-packages
get-packages: ## Get packages
	@echo ----------------------------------------------------------------
	@echo '📦  Install Homebrew'
	@echo ----------------------------------------------------------------

	# If brew -v return this will install brew
	brew -v || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

	@echo ----------------------------------------------------------------
	@echo '📦  Get Node'
	@echo ----------------------------------------------------------------

	node -v || brew install node

	@echo ----------------------------------------------------------------
	@echo '📦  Get Composer'
	@echo ----------------------------------------------------------------

	composer -v || brew install composer

	@echo ---------------------------------------------------------------- 
	@echo '🎉  Docker installed'
	@echo ----------------------------------------------------------------



.PHONY: create-zshrc
create-zshrc: ## Create .zshrc from .zshrc.example
	@echo ---------------------------------------------------------------- 
	@echo '🗂  Create .zshrc'
	@echo ----------------------------------------------------------------

	sed 's/USER_NAME/$(user)/g' .zshrc.example > .zshrc
	@echo ---------------------------------------------------------------- 
	@echo '🚀  zshrc created'
	@echo ----------------------------------------------------------------



.PHONY: get-oh-my-zsh
get-oh-my-zsh: ## Get oh my zsh
	@echo ----------------------------------------------------------------
	@echo '📦  Get oh-my-zsh'
	@echo ----------------------------------------------------------------

	@if [ ! -d "./.oh-my-zsh/" ]; then\
		git clone https://github.com/robbyrussell/oh-my-zsh.git ./.oh-my-zsh;\
	fi
	
	@echo ---------------------------------------------------------------- 
	@echo '🎉  You are now ready'
	@echo ----------------------------------------------------------------



.PHONY: get-themes
get-themes: ## Get themes
	@echo ----------------------------------------------------------------
	@echo '📦  Get spaceship prompt'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/themes/spaceship-prompt .oh-my-zsh/custom/themes/spaceship.zsh-theme
	git clone https://github.com/maximbaz/spaceship-prompt.git .oh-my-zsh/custom/themes/spaceship-prompt
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme


	@echo ----------------------------------------------------------------
	@echo '🎉  Themes installed'
	@echo ----------------------------------------------------------------



.PHONY: get-plugins
get-plugins: ## Get the differents plugins
	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-symfony-console'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/plugins/symfony-console
	git clone https://github.com/mnapoli/zsh-symfony-console-plugin.git .oh-my-zsh/custom/plugins/symfony-console

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-zsh-autosuggestions'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-syntax-highlighting'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-z'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/plugins/zsh-z
	git clone https://github.com/agkozak/zsh-z.git .oh-my-zsh/custom/plugins/zsh-z

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-async'
	@echo ----------------------------------------------------------------

	rm -rf .oh-my-zsh/custom/plugins/async
	git clone https://github.com/mafredri/zsh-async.git .oh-my-zsh/custom/plugins/async

	@echo ----------------------------------------------------------------
	@echo '📦  Get theFuck'
	@echo ----------------------------------------------------------------
	
	fuck -v || brew install thefuck

	@echo ----------------------------------------------------------------
	@echo '🎉  Plugins installed'
	@echo ----------------------------------------------------------------



.PHONY: set-global-gitignore
set-global-gitignore: ## Set a global gitignore
	@echo ---------------------------------------------------------------- 
	@echo '🙈  Set global gitignore'
	@echo ----------------------------------------------------------------

	git config --global core.excludesfile ~/.gitignore_global
	
	@echo ---------------------------------------------------------------- 
	@echo '🎉  Global gitignore set'
	@echo ----------------------------------------------------------------



.PHONY: init
init: ## Create .zshrc from .zshrc.example
	@echo ---------------------------------------------------------------- 
	@echo '🗂  Init'
	@echo ----------------------------------------------------------------
	
	make get-packages
	make user=$(user) create-zshrc
	make get-oh-my-zsh
	make get-themes
	make get-plugins
	make set-global-gitignore

	@echo ---------------------------------------------------------------- 
	@echo '🚀  You are ready'
	@echo ----------------------------------------------------------------



.PHONY: help
help: ## Show a list of available commands
	@echo
	@printf '\033[34mAvailable commands:\033[0m\n'
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort |\
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo
