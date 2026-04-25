{
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
