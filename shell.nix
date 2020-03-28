{ pkgs ? import <nixpkgs> {} }:

let
      hsPkgs = import ./default.nix { pkgs = import <nixpkgs>; };
in hsPkgs.shellFor
{
    packages = ps: with ps; [
        template-haskell-hello
    ];

    withHoogle = true;

    buildInputs = with pkgs.haskellPackages;
        [ cabal-install ];

    exactDeps = true;
}
