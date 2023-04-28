{ haskellCompiler ? "ghc927"
}:
let haskellNix = import (builtins.fetchGit
    {
        url = "https://github.com/input-output-hk/haskell.nix";
        ref = "master";
        rev = "6ab363fc7df582147a0629ba6df064ea96c500b0";
    }) {};
    native = import haskellNix.sources.nixpkgs-unstable haskellNix.nixpkgsArgs;
    arm64 = native.pkgsCross.aarch64-multiplatform;
in (arm64.haskell-nix.cabalProject
{
    src = arm64.haskell-nix.haskellLib.cleanGit { src = ./.; };
    compiler-nix-name = haskellCompiler;
}).template-haskell-hello.components.exes.template-haskell-hello
