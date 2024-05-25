{ inputs, ...}:
{
  services.polybar = 
  {
    enable = true;
    config = 
    {
      "bar/main" = {
        monitor =  "MONITOR:DP-0";
	width = "100%";
	height = "20pt";
	radius = "6";

	modules-left = "bspwm xwindow";
	modules-right = "pulseaudio memory cpu date";

        enable-ipc = "true";
      };
    };
  };
}
