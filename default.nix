let
  pkgs = import ./nix {};
in
  {
    inherit (pkgs.haskellPackages)
      nhg-example
      ;
  }
