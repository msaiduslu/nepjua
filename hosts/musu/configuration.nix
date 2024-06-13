# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  networking.hostName = "musu";
  networking.computerName = "Musu Macbook Pro";

  myNixOS = {
    bundles.darwin-desktop.enable = true;

    users = {
      musu = {
        userConfig = {...}: {
          programs.git.userName = "Muhammed Said Uslu";
          programs.git.userEmail = "msaiduslu@gmail.com";
        };
        userSettings = {};
      };
    };
  };
}
