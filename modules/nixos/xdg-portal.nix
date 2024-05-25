{inputs, config, pkgs,...}:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  };
}
