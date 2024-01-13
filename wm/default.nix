{ config, pkgs, ... }: {
  imports = [ ./cursor.nix ./foot.nix ];

  home.packages = with pkgs; [ ];
}
