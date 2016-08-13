{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      corefonts # Microsoft free fonts
      cm_unicode
      stix-otf
      dejavu_fonts
      ipafont
      source-code-pro
    ];
    # fontconfig = {
    #   dpi = 120;
    # };
  };
}
