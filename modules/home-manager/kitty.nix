{inputs, pkgs, lib, ...}:
{
  programs.kitty =
  {
    enable = true;
    #font.package = [ pkgs.fira-code ];
    font.name = lib.mkForce "Fira Code";
    font.size = 12;
    settings =
    {
      #shell = fish;
      scrollback_lines = 2000;
      open_url_with = "firefox";
      active_border_color = "#8BE9FD";
      inactive_border_color = "#44475A";

      foreground = "#ebdbb2";
      background = "#282828";

      shell = "fish";
      editor = "nvim";

      color0 = "#282828";
      color1 = "#cc241d";
      color2 = "#98971a";
      color3 = "#d79921";
      color4 = "#458588";
      color5 = "#b16286";
      color6 = "#689d6a";
      color7 = "#a89984";
      color8 = "#928374";
      color9 = "#fb4934";
      color10 = "#b8bb26";
      color11 = "#fabd2d";
      color12 = "#83a598";
      color13 = "#d3869b";
      color14 = "#8ec07c";
      color15 = "#928374";

    };
    environment =
    {
      #"EDTIROR" = "nvim";
      #"SHELL" = "fish";
    };
    extraConfig = "confirm_os_window_close 0";
  };
}
