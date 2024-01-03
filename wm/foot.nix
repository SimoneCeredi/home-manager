{ config, lib, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "JetBrains Mono:size=16";
        dpi-aware = "yes";
      };
    };
  };
}
