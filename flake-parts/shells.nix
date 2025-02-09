{
  perSystem = {
    pkgs,
    self',
    ...
  }: let
    inherit (self'.packages) go golangci-lint;

    devTools = [
      go
      golangci-lint
    ];
  in {
    devShells = {
      default = pkgs.mkShell {
        packages = devTools;
      };
    };
  };
}
