{ inputs, pkgs, lib,...}:
{
  programs.starship = 
  {
    enable = true;
    enableFishIntegration = true;
    #settings = pkgs.lib.importTOML ../../../dotfiles/.config/starship/bracketed-segments.toml;
  };
}
