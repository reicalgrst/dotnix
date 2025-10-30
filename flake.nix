{
  description = "my system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#reicalgrst-MacBookAir
    darwinConfigurations."reicalgrst-MacBookAir" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./configuration.nix

	home-manager.darwinModules.home-manager
	{
	  nixpkgs.config.allowUnfree = true;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.reicalgrst = import ./home.nix;
	}
      ];
    };
  };
}
