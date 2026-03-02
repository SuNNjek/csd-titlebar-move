{
  fetchFromGitHub,
  lib,

  hyprland,
  hyprlandPlugins,
  pkg-config,
  cmake,

  version,
}: hyprlandPlugins.mkHyprlandPlugin {
  pname = "csd-titlebar-move";
  inherit version;

  src = ../.;

  inherit (hyprland) nativeBuildInputs;

  buildInputs = [
    hyprland.dev
  ]
  ++ hyprland.buildInputs;

  meta = {
    description = "CSD titlebar move";
    homepage = "https://github.com/SuNNjek/csd-titlebar-move";
    platforms = lib.platforms.linux;
  };
}
