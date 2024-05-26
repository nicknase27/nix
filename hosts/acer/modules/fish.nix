{ inputs, ...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    set fish_greeting # Disable greeeting
    '';
    shellAliases = 
    {
      cfg = "vim ~/nix/hosts/acer/configuration.nix";
      hcfg = "vim ~/nix/hosts/acer/home.nix";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix/#diavolo";
      tst = "sudo nixos-rebuild test --flake ~/nix/#diavolo";

      ff = "clear && fastfetch";
    };
    shellInitLast = 
      ''
      starship init fish | source
      '';
    shellInit= 
      ''
#      ~/.local/bin/pfetch 
      '';
  };
}
