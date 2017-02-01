{ pkgs, ... }:
let

  nix-home = pkgs.callPackage ./nix-home.nix {};  # for declarative user configuration

in {
  # Set nixpkgs.config to something like this:
  # let common = pkgs.callPackage ./<path-to-common.nix> {}; in
  # nixpkgs.config = {
  #   allowUnfree = true;
  #   packageOverrides = pkgs_: {
  #     inherit (common.customPackages) nix-home;
  #   };
  # };
  #
  # This setting must be copied manually to avoid infinite recursion.

  customPackages = {
    inherit nix-home;
  };

  environment.systemPackages = with pkgs; [
    coreutils
    kbfs
    keybase
    git
    git-crypt
    gnumake
    gnupg
    google-chrome  # unfree
    htop
    mkpasswd
    nix-repl
    ssh-ident
    vim
    wget

    # custom packages
    # nix-home  # currently broken
  ];

  services = {
    openssh.enable = true;  # OpenSSH daemon

    emacs = {
      enable  = false;
      install = false;
    };
  };

  virtualisation = {
    virtualbox.host = {
      enable   = true;
      headless = true;
    };
  };

  security.pam = {
    enableSSHAgentAuth = true;
  };
}
