# Copyright 2025 dah4k
# SPDX-License-Identifier: EPL-2.0

HASHICORP_REPO_URL   := https://rpm.releases.hashicorp.com/RHEL/9/$$basearch/stable
HASHICORP_REPO_NAME  := "Hashicorp Stable - RHEL 9 - $$basearch"
HASHICORP_REPO_ALIAS := hashicorp
HOST_REQUIREMENTS    := virtualbox vagrant

_ANSI_NORM  := \033[0m
_ANSI_CYAN  := \033[36m

help usage:
	@grep -hE '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?##"}; {printf "$(_ANSI_CYAN)%-20s$(_ANSI_NORM) %s\n", $$1, $$2}'

all: ## Build and start all VMs (vagrant up)
	vagrant up

distclean: ## Destroy all VMs (vagrant destroy --force)
	vagrant destroy --force

install_requirements: ## Install host requirements
	zypper repos $(HASHICORP_REPO_ALIAS) || sudo zypper addrepo --refresh --name $(HASHICORP_REPO_NAME) $(HASHICORP_REPO_URL) $(HASHICORP_REPO_ALIAS)
	sudo zypper install $(HOST_REQUIREMENTS)

.PHONY: help usage start stop distclean install_requirements
