{
  perSystem = {
    config,
    pkgs,
    system,
    inputs',
    self',
    lib,
    ...
  }: {
    packages = {
      inherit (inputs'.nix-go.packages) go golangci-lint;

      default = inputs'.nix-go.legacyPackages.buildGoModule {
        pname = "sftpgo";
        version = "2.6.5";

        src = ../.;
        vendorHash = "sha256-YJwfjWg5hP29Qzq7c14LT1mSnuNfDqklvB8Slmy9XMM=";
        doCheck = false;

        meta = {
          mainProgram = "sftpgo";
        };
      };
    };
  };
}
