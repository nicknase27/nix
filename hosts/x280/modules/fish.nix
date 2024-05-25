{ inputs, ...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    set fish_greeting # Disable greeeting
    '';
    shellAliases = 
    {
      cfg = "vim ~/nix/hosts/default/configuration.nix";
      hcfg = "vim ~/nix/hosts/default/home.nix";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix/#kira";
      tst = "sudo nixos-rebuild test --flake ~/nix/#kira";

      ff = "clear && fastfetch";
    };
    shellInitLast = 
      ''
      starship init fish | source
      '';
    shellInit= 
      ''
      ~/.local/bin/pfetch 
      '';
  };
}
