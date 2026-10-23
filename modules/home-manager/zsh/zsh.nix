{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "silde" = ''
        PORT=$(curl -sS silde.dk/api/port)
        kitten ssh -p $PORT silde@ssh.silde.dk
      '';
    };

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
