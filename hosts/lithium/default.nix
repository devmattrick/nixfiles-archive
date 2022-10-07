{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../../profiles/common
    ../../profiles/server

    ../../users/matt
  ];

  config = {
    environment.systemPackages = [ pkgs.k3s ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "UTC";

    services.k3s = {
      enable = true;
      role = "server";
    };
  };
}
