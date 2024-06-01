{inputs, lib, ...}:
{
  programs.neovim = 
  {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraConfig = lib.fileContents ./init.lua;
  };
}
