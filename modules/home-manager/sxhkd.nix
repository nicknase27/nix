{ inputs, ...}:
{
  services.sxhkd = {
    enable = true;
    keybindings = 
    {
      "super + Return" = "kitty";
      # "super + d" = "sh ~/.config/rofi/launchers/type-6/launcher.sh";
      "super + d" = "dmenu_run";
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # "super + w" = "firefox";
      "super + w" = "librewolf";
    
      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + {_,shift + }q" = "bspc node -{c,k}";

      "super + f" = "bspc node -t '~fullscreen'";
      "super + shift + space" = "bspc node -t '~floating'";

      "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} {1-9,10}";
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

  };
 };
}
