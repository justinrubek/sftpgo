{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-go = {
      url = "github:matthewdargan/nix-go";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];
      imports = [
        ./flake-parts/go.nix
        ./flake-parts/shells.nix
      ];
    };
}
