HOSTNAME = $(shell hostname)

ifndef HOSTNAME
  $(error Hostname unknown)
endif

switch:
	home-manager switch --flake .#${HOSTNAME}

update:
	nix flake update

upgrade:
	make update && make switch
