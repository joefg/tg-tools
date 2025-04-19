.PHONY: help

help:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Copies scripts to ~/.local/bin
	cp tg-* ~/.local/bin/

link: ## Symlinks scripts to ~/.local/bin
	ln -S tg-* ~/.local/bin/
