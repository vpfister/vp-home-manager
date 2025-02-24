{ lib, pkgs, ... }: let
    username = "vincent";
in {
  home = {
    packages = with pkgs; [
      # hello
      cowsay 
      lolcat
    ];

    inherit username;
    # username = "vincent";
    homeDirectory = "/home/${username}";

    # add a file: tutorial
    file = {
    	"hello.txt" = {
	    text = ''
	    	#!/usr/bin/env bash

	    	echo "Hello, ${username}!"
		echo '*gloups* this is cool stuff'
	    '';
	    executable = true;
	};
    };

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
