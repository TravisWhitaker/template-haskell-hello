{ pkgs ? import <nixpkgs>
, haskellCompiler ? "ghc865"
}:
let haskellNix = import (builtins.fetchGit
    {
        url = "https://github.com/input-output-hk/haskell.nix";
        ref = "master";
        rev = "8040c12c54bfecc9931456b8c8502965d7af3b9b";
    });
    native = pkgs haskellNix;
    arm64 = (pkgs haskellNix).pkgsCross.aarch64-multiplatform;
in native.haskell-nix.cabalProject
{
    src = native.haskell-nix.haskellLib.cleanGit { src = ./.; };
    ghc = native.buildPackages.pkgs.haskell-nix.compiler.${haskellCompiler};
}
