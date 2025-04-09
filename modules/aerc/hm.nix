{ config, lib, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  options.stylix.targets.aerc.enable =
    config.lib.stylix.mkEnableTarget "aerc" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.aerc.enable) {
    programs.aerc =

      {
        extraConfig.ui.styleset-name = "stylix";

        stylesets = {
          stylix = {
            ui = with colors; {
              msglist_read = {
                bg = base00;
                fg = base05;
              };

            };
          };
        };
      };
  };
}
