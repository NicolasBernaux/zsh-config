##
# Various helpful commands
##
.DEFAULT_GOAL := help

LOCALDATE := $(shell date +'%Y%m%d-%H%M')


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
	
	brew install thefuck

	@echo ----------------------------------------------------------------
	@echo '🎉  Plugins installed'
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



.PHONY: install-oh-my-zsh
install-oh-my-zsh: ## install oh my zsh
	@echo ----------------------------------------------------------------
	@echo '📦  Get oh-my-zsh'
	@echo ----------------------------------------------------------------
	git init
	git remote add origin https://github.com/robbyrussell/oh-my-zsh.git ./.oh-my-zsh
	git pull origin	master
	rm -rf .gitignore
	@echo ---------------------------------------------------------------- 
	@echo '🎉  You are now ready'
	@echo ----------------------------------------------------------------



.PHONY: install-packages
install-packages: ## install packages
	@echo ----------------------------------------------------------------
	@echo '📦  Install Homebrew'
	@echo ----------------------------------------------------------------

	/usr/bin/ruby -e "curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew -v

	@echo ----------------------------------------------------------------
	@echo '📦  Get Node'
	@echo ----------------------------------------------------------------

	brew install node
	node -v

	@echo ----------------------------------------------------------------
	@echo '📦  Get Composer'
	@echo ----------------------------------------------------------------

	brew install composer
	composer -v

	@echo ---------------------------------------------------------------- 
	@echo '🎉  Docker installed'
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



.PHONY: create-zshrc
create-zshrc: ## Create .zshrc from .zshrc.example
	@echo ---------------------------------------------------------------- 
	@echo '🗂  Create .zshrc'
	@echo ----------------------------------------------------------------

	sed 's/USER_NAME/$(user)/g' .zshrc.example > .zshrc
	@echo ---------------------------------------------------------------- 
	@echo '🚀  zshrc created'
	@echo ----------------------------------------------------------------



.PHONY: help
help: ## Show a list of available commands
	@echo
	@printf '\033[34mAvailable commands:\033[0m\n'
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort |\
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo
