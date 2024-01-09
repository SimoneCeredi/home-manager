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

    chromium

    mongodb-compass
    # onedrive
  ];

  home.file = {
    "${config.home.homeDirectory}/.config" = {
      source = ./.dotfiles/.config;
      recursive = true;
    };
    ".ideavimrc" = {
      source = ./.dotfiles/home/.ideavimrc;
      recursive = false;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
