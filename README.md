dotfiles for Elliot Cameron (3noch)
===================================

# Dotfiles

Symlink dotfiles from `nixos/user/` to your home directory. Once `nix-home` is working we can use that instead.

The files in the repository are not hidden, so you'll need to symlink them to actual "dot" files:

```shell
ln -s dotfiles/nixos/user/bash_profile ~/.bash_profile
```


# Security

## Setting up GPG

Using keybase, login and add a new device:

```shell
keybase login
keybase pgp export --secret | gpg --allow-secret-key-import --import
```

(For reference: https://iwader.co.uk/post/signing-git-commits-keybase-gpg-key)


## Setting up SSH keys

For each system, generate a set of SSH keys for each remote system you need to access, like this:

```shell
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_<remote> -C "<host>:<remote>"
```

Configure `~/.ssh/config` to specify which identity file to use for each remote:

```
AddKeysToAgent yes

Host <remote>
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_ed25519_<remote>
```
