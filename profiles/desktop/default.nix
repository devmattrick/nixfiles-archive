{ config, pkgs, ... }: {
  imports = [
    ./modules/gnome.nix

    ../../users/matt/profiles/desktop
  ];

  programs.dconf.enable = true;

  xdg.portal.enable = true;
}
