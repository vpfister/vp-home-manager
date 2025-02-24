{ lib, pkgs, ... }
{
	home = {
		packages = with pkgs; [
			hello
		];

		username = "vincent";
		homeDirectory = "/home/vincent";

		stateVersion = "24.11";
	};
}
