{ ... }: {
  imports = [
    ../../users/matt/profiles/server
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = false;
    passwordAuthentication = false;
  };

  services.sshguard.enable = true;

  networking.firewall.enable = true;
}
