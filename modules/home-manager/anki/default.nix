{ pkgs, ... }:
{
  programs.anki = {
    enable = true;
    language = "fr_FR";
    profiles."coco" = {
      sync = {
        autoSync = true;
        syncMedia = true;
        usernameFile = "/home/coco/anki/username";
        keyFile = "/home/coco/anki/key";
      };
    };
    addons = [
      pkgs.ankiAddons.passfail2
      pkgs.ankiAddons.anki-connect
    ];
  };
}
