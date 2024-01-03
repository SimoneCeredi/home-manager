{ config, pkgs, profile, ... }:

{
  home.username = "simone";
  home.homeDirectory = "/home/simone";

  imports = [
    ./app
    ./lang
    ./shell
    ./wm
    # (./. + "./config/"+profile)
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code fira-code-symbols
    terminus_font
    jetbrains-mono
    powerline-fonts
    gelasio
    nerdfonts
    iosevka
    noto-fonts noto-fonts-cjk noto-fonts-emoji
    source-code-pro
    ttf_bitstream_vera
    terminus_font_ttf
    font-awesome
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    "${config.home.homeDirectory}/.config/sway"= {
      source = ./.config/sway;
      recursive = true;
    };

    "${config.home.homeDirectory}/.config/waybar"= {
      source = ./.config/waybar;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
