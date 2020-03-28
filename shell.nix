let
  hsPkgs = import ./default.nix {};
in
  hsPkgs.template-haskell-hello.components.all
