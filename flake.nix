{
  description = "Flake for the official kotlin-lsp before it gets into nixpkgs";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
  };

  outputs = { self, nixpkgs, ... }: let
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    eachSystem = f: nixpkgs.lib.genAttrs systems
      (system: f system nixpkgs.legacyPackages.${system});
  in {
    packages = eachSystem (system: pkgs: {
      kotlin-lsp = pkgs.callPackage ./package.nix { };
      default = self.packages.${system}.kotlin-lsp;
    });

    devShells = eachSystem (system: pkgs: {
      default = pkgs.mkShell {
        name = "kotlin-lsp";

        packages = [
          self.packages.${system}.kotlin-lsp
        ];

        inputsFrom = [
          self.packages.${system}.kotlin-lsp
        ];
      };
    });
  };
}
