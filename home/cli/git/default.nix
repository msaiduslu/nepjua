{
  inputs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
  };
}