{
  fetchFromGitHub,
  lib,

  hyprland,
  pkg-config,

  version,
}: hyprland.stdenv.mkDerivation {
  pname = "csd-titlebar-move";
  inherit version;

  src = ../.;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    hyprland.dev
  ]
  ++ hyprland.buildInputs;

  installPhase = ''
    mkdir -p $out/lib/
    cp csd-titlebar-move.so $out/lib/libcsd-titlebar-move.so
  '';

  meta = {
    description = "CSD titlebar move";
    homepage = "https://github.com/SuNNjek/csd-titlebar-move";
    platforms = lib.platforms.linux;
  };
}
