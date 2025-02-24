{ lib, pkgs, ... }: let
    username = "vincent";
    email = "vincent@famille-pfister.net";
    wallpaperImg = pkgs.fetchurl {
        url = "https://images8.alphacoders.com/137/1374345.jpg";
        hash = "sha256:f356cd6c4f516562614a2bd20596d72926ca619f185ef484613e4af0e7a52943";
    };
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

    dconf = {
        enable = true;

        settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
            };
            "org/gnome/desktop/background" = {
                picture-uri = "file://${wallpaperImg}";
                picture-uri-dark = "file://${wallpaperImg}";
            };
            "org/gnome/desktop/screensaver" = {
                picture-uri = "file://${wallpaperImg}";
            };
        };
    };
}
