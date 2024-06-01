{ config, inputs, pkgs, ...}:
{
  imports = 
  [
    inputs.home-manager.nixosModules.default
  ];

  ### Enable Flakes and unfree software
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  ### Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### Networking
  networking.networkmanager.enable = true;
  
  ### Timezone and locales
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = 
  {
    LC_ADRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  ### Xorg
  services.xserver = 
  {
    enable = true;
    windowManager = 
    {
      bspwm.enable = true;
    };

    xkb.layout = "us";
    xkb.variant = "";
  };

  services.displayManager.autoLogin = 
  {
    enable = true;
    user = "nick";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  ### Audio
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = 
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ### Users
  users.users.nick = 
  {
    isNormalUser = true;
    description = "nick";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  ### Install Packages
  environment.systemPackages = with pkgs; [
    librewolf
    wget
    curl
    stow
    kitty
    starship
    dunst
    feh
    flameshot
    neovim
    libgcc
    unzip
    gruvbox-gtk-theme
    gruvbox-plus-icons
  ];

  ### Fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome_6
  ];

  ### Set the theme
  stylix = 
  {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = pkgs.fetchurl 
    {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/anime/anime_skull.png";
      sha256 = "0gj2652y8p17gi5v6x39bnci3vh3rbag4gmrb5pml3805n12v3vh";
    };
  };

  ### Enable git and ssh
  programs.git.enable = true;
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  ### Allow unfree packages in home-manager
  home-manager.users.nick.nixpkgs.config.allowUnfree = true;

}
