{ pkgs ? import <nixpkgs>
, haskellCompiler ? "ghc883"
}:
let haskellNix = import (builtins.fetchGit
    {
        url = "https://github.com/TravisWhitaker/haskell.nix";
        ref = "linux-cross-aarch64-fix";
        rev = "1c556d0f028d71da6b63d08e0fce568388397d51";
    });
    native = pkgs haskellNix;
    arm64 = (pkgs haskellNix).pkgsCross.aarch64-multiplatform;
in arm64.haskell-nix.cabalProject
{
    src = arm64.haskell-nix.haskellLib.cleanGit { src = ./.; };
    ghc = arm64.buildPackages.pkgs.haskell-nix.compiler.${haskellCompiler};
}
