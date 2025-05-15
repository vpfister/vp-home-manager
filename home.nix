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
      # CLI tools
      gnumake
      gnused
      neovim
      jq

      # dev tools
      lazygit

      # monitoring
      htop
      btop
      lm_sensors

      # fonts
      (nerdfonts.override { fonts = ["JetBrainsMono" "DroidSansMono" ]; })
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

        alacritty = {
            enable = true;
            settings = {
                env.TERM = "xterm-256color";
                window.padding = {
                    x = 10;
                    y = 10;
                };
                window.decorations = "none";
		window.opacity = 0.9;
                scrolling.history = 10000;
                font = {
                    normal = {
                        family = "JetBrains Mono Nerd Font";
                        style = "Regular";
                    };
                    bold = {
                        family = "JetBrains Mono Nerd Font";
                        style = "Bold";
                    };
                    italic = {
                        family = "JetBrains Mono Nerd Font";
                        style = "Italic";
                    };
                    size = 10;
                };
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
