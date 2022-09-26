{ ... }: {
  imports = [
    ./modules/git.nix
    ./modules/micro.nix
    ./modules/shell.nix
  ];

  users.users.matt = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  # Set home-manager state version for my user
  home-manager.users.matt.home.stateVersion = "22.11";
}
