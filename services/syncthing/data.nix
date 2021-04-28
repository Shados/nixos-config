{ config, lib, pkgs, ... }:
with lib;
{
  services.syncthing = {
    declarative = {
      devices = {
        dreamlogic = {
          addresses = [ "tcp://home.shados.net:22000" ];
          id = "DOXL73C-CUSNSZU-L2RMPH2-A72HBTQ-X6DKNFU-UTRQPA5-GYZDISE-HP75MQY";
        };
        lg_g8s = {
          id = "H7TGIVN-IYMTGHV-73E7SEP-MP5YWY7-52QNQ4T-UZL73YC-TA5LEJR-4XWAMQO";
        };
        stowaway = {
          addresses = [ "tcp://stowaway.shados.net:22000" ];
          id = "IOLIFRQ-SCKCXRM-HXGGTMY-TB3GSAL-3HUGL4S-G3MOK6C-MOD6EDU-TYOTHA6";
        };
        theroadnottaken = {
          id = "HZUS7FV-2IDGXML-KQ2J527-3LY4ERQ-RVRMSWG-MW64N4Z-MJKV5NR-KTNIEQE";
        };
        whatliesbelow = {
          id = "RZCSRQT-SWTOY4T-444OALP-DFC2ZPD-EUMBYKN-UBT6EPG-Y46MGIS-AFKAYAH";
          addresses = [ "tcp://whatliesbelow.shados.net:22000" ];
        };
        whitetulip = {
          id = "EAQKQBZ-NR4GLKD-6CQ4S5A-ALO4MZU-6NRNWOK-YEPEZVC-CXADG7G-QHWHFQI";
          addresses = [ "tcp://whitetulip.shados.net:22000" ];
        };
      };
      folders = let inherit (config.services.syncthing) dataDir; in {
        "${dataDir}/notes" = {
          id = "notes"; label = "Notes";
          devices = [
            "dreamlogic" "lg_g8s" "stowaway" "theroadnottaken" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/secure" = {
          id = "secure"; label = "Secure";
          devices = [
            "dreamlogic" "lg_g8s" "stowaway" "theroadnottaken" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/photos/mi_mix_3" = {
          id = "mi_mix_3_exbj-photos"; label = "Main Phone Photos";
          devices = [
            "dreamlogic" "lg_g8s" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/photos/dap" = {
          id = "lg-us998_c3tg-photos"; label = "DAP Photos";
          devices = [
            "dreamlogic" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/MiMix3/calls" = {
          id = "eiqqp-3kag8"; label = "Mi Mix 3 Calls";
          devices = [
            "dreamlogic" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/lg_g8s/calls" = {
          id = "sj28t-854ug"; label = "LG G8s Calls";
          devices = [
            "dreamlogic" "lg_g8s" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
      };
    };
  };
}
