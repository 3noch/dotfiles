{
  allowUnfree = true;

  packageOverrides = pkgs: {
    emacs = import ./emacs.nix { inherit pkgs; };
  };
}
