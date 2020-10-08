let
  pkgs = import ./nix {};
in pkgs.haskellPackages.shellFor
  {
    packages = p: [ p.nhg-example ];
    withHoogle = false;
    buildInputs = [ pkgs.cabal-install pkgs.haskellPackages.ghcide ];
  }
