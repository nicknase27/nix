{ inputs, pkgs, ...}:
{
  xsession.windowManager.bspwm = {
    enable=true;
    settings = {
      border_width = 2;
      window_gap = 12;

      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
    };
    monitors = {
      eDP-1 = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
      ];
    };
    extraConfigEarly = "pgrep -x sxhkd > /dev/null || sxhkd &";
    extraConfig = "
    polybar &
    dunst &
    ~/.fehbg &";
  };
}
