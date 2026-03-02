{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    allSystems = builtins.attrNames nixpkgs.legacyPackages;

    forAllSystems = (f:
      nixpkgs.lib.genAttrs allSystems (system:
        f nixpkgs.legacyPackages.${system}
      )
    );
  in {
    packages = forAllSystems (pkgs: {
      csd-titlebar-move = pkgs.callPackage ./nix/package.nix {
        version = self.shortRev or self.dirtyShortRev;
      };

      default = self.packages.${pkgs.stdenv.hostPlatform.system}.csd-titlebar-move;
    });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell.override { stdenv = pkgs.gcc14Stdenv; } {
        buildInputs = [pkgs.hyprland];
        inputsFrom = [pkgs.hyprland];
      };
    });
  };
}
