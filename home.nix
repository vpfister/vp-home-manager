{ lib, pkgs, ... }: let
    username = "vincent";
    email = "vincent@famille-pfister.net";
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

    stateVersion = "24.11";
    };

    programs = {

        home-manager = {
            enable = true;
        }; 

        git = {
            enable = true;
            userName = "${username}";
            userEmail = "${email}";
            aliases = {
                co = "checkout";
                st = "status";

            };
            extraConfig = {
                init.defaultBranch = "main";
                core.editor = "nvim";
            };
        };
    };
}
