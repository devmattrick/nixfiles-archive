# Kinda experimental GNOME environment with most of the features I don't like repalced with other tools. Not using rn
# because I don't really wanna put in the effort...

{ pkgs, home-manager, ... }: {
  home-manager.users.matt = {
    home.packages = with pkgs; [
      gnome.dconf-editor
      gnomeExtensions.appindicator
      gnomeExtensions.hide-top-bar
      gnomeExtensions.no-overview
      rofi
    ];

    # A bunch of config changes to make GNOME bearable
    dconf.settings = {
      # Disable activities hot corner
      "org/gnome/desktop/interface" = {
        enable-hot-corners = false;
      };

      # Use the window switcher on Alt-Tab instead of application switcher (why is this not the default??)
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [ ];
        switch-applications-backward = [ ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
      };

      # Disable overview key in mutter
      "org/gnome/mutter" = {
        overlay-key = "";
      };

      # Enable GNOME extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          "appindicatorsupport@rgcjonas.gmail.com"
          # "dash-to-panel@jderose9.github.com"
          "hidetopbar@mathieu.bidon.ca"
          "no-overview@fthx"
        ];
      };

      # Disable laucher + overview hotkeys (I'm using rofi and polybar instead)
      "org/gnome/shell/keybindings" = {
        # toggle-overview = [ ];
        toggle-application-view = [ ];
      };

      # Show icons and window in window switcher
      "org/gnome/shell/window-switcher" = {
        app-icon-mode = "both";
      };

      # Configure hide top bar extension to always hide the top bar
      "org/gnome/shell/extensions/hidetopbar" = {
        enable-active-window = false;
        enable-intellihide = false;
        mouse-sensitive-fullscreen-window = false;
        show-in-overview = false;
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "rofi -show run";
        name = "rofi run";
      };

      "org/gtk/gtk4/Settings/FileChooser" = {
        show-hidden = true;
      };
    };
  };
}
