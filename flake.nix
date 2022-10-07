{
  description = "NixOS system configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      # vm - vm for testing
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/vm
        ];

        specialArgs = inputs;
      };

      # hydrogen - workstation/ gaming pc
      hydrogen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/hydrogen
        ];

        specialArgs = inputs;
      };

      # helium - hypothetical laptop
      helium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/helium
        ];

        specialArgs = inputs;
      };

      # lithium - single node k3s cluster
      lithium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/lithium
        ];

        specialArgs = inputs;
      };
    };
  };
}
