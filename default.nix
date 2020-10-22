{ pkgs ? import <nixpkgs> {}
}:

pkgs.callPackage ./1password.nix {}
