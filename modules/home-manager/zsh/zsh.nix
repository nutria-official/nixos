{ config, configPath, host, ...}:

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
      "rebuild" = ''
        (cd ${configPath} && git add .)
        sudo nixos-rebuild switch --flake ${configPath}#${host}
      '';
      "pl" = ''
        pass-cli login --pat $(cat ${config.sops.secrets."pass-cli-token".path})
        pass-cli ssh-agent daemon start
        export SSH_AUTH_SOCK=/home/jonathan/.ssh/proton-pass-agent.sock
      '';
    };

    initContent = ''
      ${(builtins.readFile ./yazi-cd.sh)}
    '';
  };
}
