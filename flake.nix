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
    # vm - vm for testing
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/vm
      ];

      specialArgs = inputs;
    };

    # hydrogen - workstation/ gaming pc
    nixosConfigurations.hydrogen = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/hydrogen
      ];

      specialArgs = inputs;
    };

    # helium - single node k8s server
    nixosConfigurations.helium = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/helium
      ];

      specialArgs = inputs;
    };
  };
}
