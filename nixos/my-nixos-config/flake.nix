{
  description = "Nix with Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
  	# create a nixOS-system module i call 'nixos' (hostname)
    nixosConfigurations.ronaldoal = nixpkgs.lib.nixosSystem {
      
      # define system architecture, so packages know how to install
      system = "x86_64-linux";
      
      # let the modules include my inputs using the builtin 'specialArgs' attribute
      specialArgs = {inherit inputs;};
      modules = [
      	# Point to a Nix file containing my system configuration
        ./configuration.nix
      ];
    };
  };
}

