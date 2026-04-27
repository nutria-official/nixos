{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "maple" = "steam-run ~/school/applications/maple/bin/xmaple";
    };

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
