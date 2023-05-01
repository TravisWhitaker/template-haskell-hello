{ haskellCompiler ? "ghc927"
}:
let haskellNix = import (builtins.fetchGit
    {
        url = "https://github.com/input-output-hk/haskell.nix";
        ref = "master";
        rev = "5abcfb51bbe985b8dfd4917058d9a2a9da49e007";
    }) {};
    native = import haskellNix.sources.nixpkgs-unstable haskellNix.nixpkgsArgs;
    arm64 = native.pkgsCross.aarch64-multiplatform;
in (arm64.haskell-nix.cabalProject
{
    src = arm64.haskell-nix.haskellLib.cleanGit { src = ./.; };
    compiler-nix-name = haskellCompiler;
}).template-haskell-hello.components.exes.template-haskell-hello
