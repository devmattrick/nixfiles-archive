{ ... }: {
  home-manager.users.matt = {
    programs.micro = {
      enable = true;
      settings = ''
        {
          "autosu": true,
          "mkparents": true
        }
      '';
    };
  };
}
