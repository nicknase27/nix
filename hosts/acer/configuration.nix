# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../common.nix
      ./hardware-configuration.nix
      ../../modules/nixos/xdg-portal.nix
    ];

  networking.hostName = "Diavolo"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nick" = import ./home.nix;
    };
  };

  services.tlp = {
    enable = true;
  };

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
	      turbo = "never";
      };
      charger = {
        governor = "performance";
	      turbo = "auto";
      };
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?

}
