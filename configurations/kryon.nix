{
  inputs,
  flake,
}: let
  inherit
    (inputs)
    nixpkgs
    alejandra
    nixos-wsl
    nix-index-database
    home-manager
    nix-ld
    ;
in
  nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;
      inherit flake system;
    }; # Pass flake inputs to our config

    modules = [
      {
        environment.systemPackages = [
          alejandra.defaultPackage.${system}
        ];
      }
      nix-ld.nixosModules.nix-ld
      ./src/nix-ld.nix
      nixos-wsl.nixosModules.wsl
      ./src/wsl/base.nix
      ./src/wsl/rancher.nix
      nix-index-database.nixosModules.nix-index
      {
        programs.nix-index-database.comma.enable = true;
        programs.nix-index.enable = true;
        programs.command-not-found.enable = false;
      }
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.nepjua = import ../home/profiles/nixos-wsl;
          extraSpecialArgs = {inherit inputs;};
        };
      }
    ];
  }
