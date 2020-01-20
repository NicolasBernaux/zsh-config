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

	rm -rf custom/plugins/symfony-console
	git clone https://github.com/mnapoli/zsh-symfony-console-plugin.git custom/plugins/symfony-console

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-zsh-autosuggestions'
	@echo ----------------------------------------------------------------

	rm -rf custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git custom/plugins/zsh-autosuggestions

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-syntax-highlighting'
	@echo ----------------------------------------------------------------

	rm -rf custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git custom/plugins/zsh-syntax-highlighting

	@echo ----------------------------------------------------------------
	@echo '📦  Get zsh-autosuggestions'
	@echo ----------------------------------------------------------------

	rm -rf custom/plugins/zsh-z
	git clone https://github.com/agkozak/zsh-z.git custom/plugins/zsh-z


	@echo ----------------------------------------------------------------
	@echo '🎉  plugins installed'
	@echo ----------------------------------------------------------------



.PHONY: get-themes
get-themes: ## Get themes
	@echo ----------------------------------------------------------------
	@echo '📦  Get spaceship'
	@echo ----------------------------------------------------------------

	rm -rf custom/themes/spaceship-promp custom/themes/spaceship.zsh-theme
	git clone https://github.com/maximbaz/spaceship-prompt.git custom/themes/spaceship-promp
	ln -s custom/themes/spaceship-prompt/spaceship.zsh-theme custom/themes/spaceship.zsh-theme


	@echo ----------------------------------------------------------------
	@echo '🎉  themes installed'
	@echo ----------------------------------------------------------------



.PHONY: install-oh-my-zsh
install-oh-my-zsh: ## install
	git init
	git remote add origin https://github.com/robbyrussell/oh-my-zsh.git
	git pull origin	master
	rm -rf .gitignore
	@echo ---------------------------------------------------------------- 
	@echo '🎉  You are now ready'
	@echo ----------------------------------------------------------------



.PHONY: set-global-gitignore
set-global-gitignore: ## Show a list of available commands
    @echo ---------------------------------------------------------------- 
    @echo '🙈  Set global gitignore'
    @echo ----------------------------------------------------------------

    git config --global core.excludesfile ~/.gitignore_global
    
    @echo ---------------------------------------------------------------- 
    @echo '🎉  Global gitignore set'
    @echo ----------------------------------------------------------------



.PHONY: help
help: ## Show a list of available commands
	@echo
	@printf '\033[34mAvailable commands:\033[0m\n'
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort |\
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

