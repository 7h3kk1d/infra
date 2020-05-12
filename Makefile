SHELL := /bin/bash

# Heavily inspired by https://github.com/ps1337/Dotfile-tools/blob/master/Makefile
#
deploy: ## Run all roles
	ansible-playbook --ask-become-pass -i "localhost," -c local local.yml

ansible: ## Install ansible
	if which pacman; then \
		sudo pacman --noconfirm -S ansible; \
	elif [[ $$(cat /etc/os-release  | grep debian | wc -l) -gt 0 ]]; then \
		sudo apt-get update && \
		sudo apt-get -y install gnupg && \
		sudo echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
		sudo apt-get update && \
		sudo apt-get -y install ansible; \
	elif which apt-add-repository; then \
		sudo apt-get update && \
		sudo apt-get -y install gnupg && \
		sudo apt-add-repository -y ppa:ansible/ansible && \
		sudo apt-get update && \
		sudo apt-get install -y ansible; \
fi
