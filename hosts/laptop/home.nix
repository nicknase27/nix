{ config, pkgs, nix-colors, ... }:

{
  imports = [
    #nix-colors.homeManagerModules.default
    ../../modules/home-manager/bspwm.nix
    ../../modules/home-manager/sxhkd.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/neovim.nix
    #../../modules/home-manager/polybar.nix
    ../../modules/home-manager/fish.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  pkgs.fastfetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  gtk.iconTheme = {
    name = "gruvbox-plus-icons";
    package = pkgs.gruvbox-plus-icons;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
