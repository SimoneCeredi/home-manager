{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    hostname = "pulse14";
    # ----- USER SETTINGS ----- #
    username = "simone"; # username
    name = "SimoneCeredi"; # name/identifier
    email = "ceredi.simone.iti@gmail.com"; # email (used for certain configurations)
    wm = "i3"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
    wmType = "x11"; # x11 or wayland

    # configure pkgs
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    # configure lib
    lib = nixpkgs.lib;
  in {
      homeConfigurations = {
        pulse14 = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./home.nix 
            ./config/pulse14
          ]; # load home.nix from selected PROFILE
          extraSpecialArgs = {
            # pass config variables from above
            inherit username;
            inherit name;
            inherit hostname;
            inherit email;
            inherit wm;
            inherit wmType;
          };

        };
    };
  };
}

