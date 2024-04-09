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
    ./browser.nix
  ];

  home.file = {
    ".config/autostart/1password.desktop".source = "${pkgs._1password-gui.outPath}/share/applications/1password.desktop";
    ".config/autostart/copyq.desktop".source = "${pkgs.copyq.outPath}/share/applications/com.github.hluk.copyq.desktop";
    ".config/autostart/guake.desktop".source = "${pkgs.guake.outPath}/share/applications/guake.desktop";
    ".config/autostart/warp-terminal.desktop".source = "${pkgs.warp-terminal.outPath}/share/applications/dev.warp.Warp.desktop";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vlc
    copyq
    parsec-bin
    obs-studio
    bottles
    qbittorrent
    slack
    obsidian
    zoom-us
    spotify
    warp-terminal
  ];

  services.spotifyd = {
    enable = true;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/share/flatpak/exports/share";
  };
}
