{
  inputs,
  lib,
  config,
  pkgs,
  colors,
  ...
}: {
  imports = [
    ./gnome
    ./guake
    ./browser.nix
    ./_1password.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Applications
    copyq
    qbittorrent
    vlc
    discord
    betterdiscordctl
    slack
  ];

  home.sessionVariables = {
    XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:$HOME/share/flatpak/exports/share";
  };
}