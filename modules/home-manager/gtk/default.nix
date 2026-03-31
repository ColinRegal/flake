{
  gtk = {
    enable = true;
    gtk4.theme = null;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
