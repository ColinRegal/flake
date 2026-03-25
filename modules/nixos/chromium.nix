{
  # Install and configure chromium
  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" # uBlock Origin Lite
      "likgccmbimhjbgkjambclfkhldnlhbnn;https://clients2.google.com/service/update2/crx" # Yomitan
      "hkledmpjpaehamkiehglnbelcpdflcab;https://clients2.google.com/service/update2/crx" # asbplayer
      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # Bitwarden
      "mgngbgbhliflggkamjnpdmegbkidiapm;https://clients2.google.com/service/update2/crx" # Remove Youtube Shorts
      "clngdbkpkpeebahjckkjfobafhncgmne;https://clients2.google.com/service/update2/crx" # Stylus
      "ammjkodgmmoknidbanneddgankgfejfh;https://clients2.google.com/service/update2/crx" # 7TV
      "ajopnjidmegmdimjlfnijceegpefgped;https://clients2.google.com/service/update2/crx" # BetterTTV
      "cmeakgjggjdlcpncigglobpjbkabhmjl;https://clients2.google.com/service/update2/crx" # Steam Inventory Helper
    ];
    # Option list: https://chromeenterprise.google/policies
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = "true";
      "PasswordManagerEnabled" = "false";
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "fr"
        "en-US"
      ];
      "ExtensionDeveloperModeSettings" = 0;

    };
  };
}
