{ pkgs ? import <nixpkgs> {} }:

let 
  # TODO: revert back to stable once 1.65.0 is merged
  # unstable = import <nixos-unstable> {};
in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cargo
    gcc
    rustc
  ];
  buildInputs = with pkgs; [
    clippy
    rust-analyzer
    rustfmt
  ];

  RUST_BACKTRACE = 1;
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
