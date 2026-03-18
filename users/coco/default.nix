{ pkgs, ... }:

{
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coco = {
    isNormalUser = true;
    description = "coco";
    useDefaultShell = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      discord
      openrgb-with-all-plugins
      signal-desktop
      chromium
      (anki.withAddons (
        with ankiAddons;
        [
          passfail2
          anki-connect
          (recolor.withConfig {
            config = builtins.fromJSON (builtins.readFile ./../../themes/anki/mocha.json);
          })
          # AJT doesn't exist, code: 13444852330
        ]
      ))
    ];
  };

}
