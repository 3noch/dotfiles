{ pkgs, ... }:
let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
]) ++ (with epkgs.melpaPackages; [
  flycheck
  helm
  intero
  magit          # ; Integrate git <C-x g>
  undo-tree      # ; <C-x u> to show the undo tree
  nix-mode
  zerodark-theme # ; Nicolas' theme
  #zoom-frm       # ; increase/decrease font size for all buffers C-x C-+>
]) ++ (with epkgs.elpaPackages; [
  beacon         # ; highlight my cursor when scrolling
  nameless       # ; hide current package name everywhere in elisp code
]) ++ [
])
