{ config, pkgs, profile, ... }:

{
  home.username = "simone";
  home.homeDirectory = "/home/simone";

  # once obsidian updates electron this can be removed
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

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
    fira-code
    fira-code-symbols
    terminus_font
    jetbrains-mono
    powerline-fonts
    gelasio
    nerdfonts
    iosevka
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-code-pro
    ttf_bitstream_vera
    terminus_font_ttf
    font-awesome

    chromium

    mongodb-compass
    # postman
    # onedrive
    discord
    qbittorrent
    vlc
    obsidian
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
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
