{ inputs, ...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = '' 
    set fish_greeting # Disable greeeting
    '';
    shellAliases = 
    {
      cfg = "vim ~/nixv2/hosts/pc/configuration.nix";
      hcfg = "vim ~/nixv2/hosts/pc/home.nix";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixv2/#dio";
      tst = "sudo nixos-rebuild test --flake ~/nixv2/#dio";

      vim = "nvim";
      vi = "nvim";

      ff = "clear && fastfetch";
    };
    shellInitLast = ''
      starship init fish | source
    '';
    shellInit= 
      '' 
      ~/.local/bin/pfetch 
      '';
  };
}
