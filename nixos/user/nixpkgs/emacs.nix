{ pkgs, ... }:
let
  emacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacs25).emacsWithPackages;
in
emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
]) ++ (with epkgs.melpaPackages; [
  flycheck
  haskell-mode
  helm
  helm-swoop
  intero
  magit            # ; Integrate git <C-x g>
  multiple-cursors # ; http://pragmaticemacs.com/emacs/multiple-cursors/
  undo-tree        # ; <C-x u> to show the undo tree
  nix-mode
  zerodark-theme   # ; Nicolas' theme
  #zoom-frm         # ; increase/decrease font size for all buffers C-x C-+>
]) ++ (with epkgs.elpaPackages; [
  beacon         # ; highlight my cursor when scrolling
  nameless       # ; hide current package name everywhere in elisp code
]) ++ [
])
