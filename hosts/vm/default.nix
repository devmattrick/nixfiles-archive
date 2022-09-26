{ modulesPath, ... }: {
  imports = [
    "${modulesPath}/profiles/qemu-guest.nix"
    "${modulesPath}/virtualisation/qemu-vm.nix"

    ../../profiles/common
    ../../profiles/desktop
  ];

  config = {
    time.timeZone = "America/Los_Angeles";

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;

    fileSystems."/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      autoResize = true;
    };

    boot = {
      growPartition = true;
      kernelParams = [ "console=ttyS0" "boot.shell_on_fail" ];
      loader.timeout = 5;
    };

    virtualisation = {
      diskSize = 20480;
      memorySize = 8192;
      writableStoreUseTmpfs = false;

      # Disable OVMF (GPU passthrough)
      libvirtd.qemu.ovmf.enable = false;

      qemu.options = [ "-vga qxl" "-display gtk,grab-on-hover=on" ];
    };

    environment.variables.WLR_RENDERER_ALLOW_SOFTWARE = "1";

    security.polkit.enable = true;

    users.mutableUsers = false;
    users.allowNoPasswordLogin = true;
    users.users.matt.hashedPassword = "$6$ZOK4LZdqFJ/Mb0Ya$DMdBoSu0sB.Yw7Qr.HF7HJJL5M/ENFnff2IN0vAWUhJ.0m9n13WTfeCmQsuhStUl0Xyg5v7bvZKeVLhC.ZZhj1";
  };
}
