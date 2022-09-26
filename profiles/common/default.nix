{ pkgs, home-manager, ... }: {
  imports = [
    home-manager.nixosModule
    ../../users/matt/profiles/common
  ];

  # Set state version
  system.stateVersion = "22.11";


  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable zsh shell completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  # Set up home-manager options
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
