{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    initContent = ''
      # Ctrl + flèches (comme bash/readline)
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
    '';
    plugins = [

    ];
  };
}
