.PHONY: update
update:
	home-manager switch --flake .#vincent

.PHONY: clean
clean:
	nix-collect-garbage -d
