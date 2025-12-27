{
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
