{ config, lib, pkgs, name, email, ... }:

{
  home.file.".ssh/allowed_signers" = {
    source = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    recursive = false;
  };
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig = {
      init.defaultBranch = "master";
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
