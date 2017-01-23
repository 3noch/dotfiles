{ pkgs, ... }:
let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
  magit          # ; Integrate git <C-x g>
  zerodark-theme # ; Nicolas' theme
]) ++ (with epkgs.melpaPackages; [
  helm
  undo-tree      # ; <C-x u> to show the undo tree
  #zoom-frm       # ; increase/decrease font size for all buffers C-x C-+>
]) ++ (with epkgs.elpaPackages; [
  beacon         # ; highlight my cursor when scrolling
  nameless       # ; hide current package name everywhere in elisp code
]) ++ [
])
