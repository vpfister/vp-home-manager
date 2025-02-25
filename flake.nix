# flake.nix
{
	description = "VP Home manager configuration";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		catppuccin.url = "github:catppuccin/nix";
	};

	outputs = { nixpkgs, home-manager, catppuccin, ... }:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in {
			homeConfigurations = {
				vincent = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					modules = [ 
						./home.nix 
						catppuccin.homeManagerModules.catppuccin
					];
				};
			};
		};
}
