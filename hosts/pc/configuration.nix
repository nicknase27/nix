# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/xdg-portal.nix
      ../../modules/nixos/steam.nix
    ];

  nix.settings.auto-optimise-store = true;

  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "Dio"; # Define your hostname.

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    description = "nick";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     discord
     spotify
     starship
     polybar
     bluej
     rofi
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nick" = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bluej
  ];


  system.stateVersion = "23.11"; # Did you read the comment?

}
