{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "silde" = ''
        PORT=$(curl -sS silde.dk/api/port)
        kitten ssh -p $PORT silde@ssh.silde.dk -t \
        "env EDITOR=nvim VISUAL=nvim nix shell nixpkgs#neovim nixpkgs#yazi -c bash -i"
      '';
    };

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
