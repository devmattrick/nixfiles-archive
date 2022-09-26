{ ... }: {
  services.xserver = {
    enable = true;

    # Might end up switching to labwc when things become more stable
    desktopManager.gnome.enable = true;
  };

  services.picom.enable = true;
}
