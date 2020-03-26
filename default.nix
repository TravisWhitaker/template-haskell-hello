{ pkgs ? import <nixpkgs>
, haskellCompiler ? "ghc883"
}:
let haskellNix = import (builtins.fetchGit
    {
        url = "https://github.com/input-output-hk/haskell.nix";
        ref = "master";
        rev = "c713316282500c520bfe818475f483969866a0bd";
    });
    native = pkgs haskellNix;
    arm64 = (pkgs haskellNix).pkgsCross.aarch64-multiplatform;
in arm64.haskell-nix.cabalProject
{
    src = arm64.haskell-nix.haskellLib.cleanGit { src = ./.; };
    ghc = arm64.buildPackages.pkgs.haskell-nix.compiler.${haskellCompiler};
}
