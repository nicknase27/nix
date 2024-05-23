# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/xdg-portal.nix
      ../../modules/nixos/steam.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "Dio"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  programs.git.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nick";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;

  # Install firefox.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   firefox
   wget
   curl
   stow
   kitty
   dunst
   feh
   swayfx
   grim
   slurp
   wl-clipboard
   mako
   flameshot
   kanshi
   gruvbox-gtk-theme
   gruvbox-plus-icons
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.image = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/anime/anime_skull.png";
    sha256 = "0gj2652y8p17gi5v6x39bnci3vh3rbag4gmrb5pml3805n12v3vh";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  system.stateVersion = "23.11"; # Did you read the comment?

}
