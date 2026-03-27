{ pkgs, ... }:
{
  programs.anki = {
    enable = true;
    language = "fr_FR";
    theme = "followSystem";
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
    answerKeys = [
      {
        ease = 1;
        key = "&";
      }
      {
        ease = 3;
        key = "\"";
      }
    ];
  };
}
