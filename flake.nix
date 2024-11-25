{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.05";
    systems.url = "github:nix-systems/default-linux";

    hardware.url = "github:nixos/nixos-hardware";

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      hardware,
      nixos-wsl,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      overlays = import ./overlays { inherit inputs outputs; };

      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);

      nixosConfigurations = {
        # Main desktop WSL
        keter = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ (import ./hosts/keter { inherit nixos-wsl; }) ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };
    };
}
