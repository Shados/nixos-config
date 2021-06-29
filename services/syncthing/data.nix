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
        lg_v50 = {
          id = "22DR3KD-ZDNLB4A-YMCZQT4-WTNLZ7R-2MVGQN2-CADGUDN-XU6RMAS-DFPHCAN";
        };
        mi_mix_3 = {
          id = "4BCRTXN-RCPJQUN-SNNQK6E-3Q36RA4-NYC7V6W-DK55IJY-FOSQ5PF-WGRFEQZ";
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
            "dreamlogic" "lg_v50" "mi_mix_3" "stowaway" "theroadnottaken" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/secure" = {
          id = "secure"; label = "Secure";
          devices = [
            "dreamlogic" "lg_v50" "mi_mix_3" "stowaway" "theroadnottaken" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/photos/dap" = {
          id = "lg-us998_c3tg-photos"; label = "Photos: DAP";
          devices = [
            "dreamlogic" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/photos/lg_v50" = {
          id = "lg_v50-photos"; label = "Photos: LG V50";
          devices = [
            "dreamlogic" "lg_v50" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/photos/mi_mix_3" = {
          id = "mi_mix_3_exbj-photos"; label = "Photos: Mi Mix 3";
          devices = [
            "dreamlogic" "mi_mix_3" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/lg_v50/calls" = {
          id = "lg_v50-calls"; label = "Phone Calls: LG V50";
          devices = [
            "dreamlogic" "lg_v50" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/lg_v50/backups" = {
          id = "lg_v50-backups"; label = "Phone Backups: LG V50";
          devices = [
            "dreamlogic" "lg_v50" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/MiMix3/calls" = {
          id = "eiqqp-3kag8"; label = "Phone Calls: Mi Mix 3";
          devices = [
            "dreamlogic" "mi_mix_3" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/MiMix3/backups" = {
          id = "mi_mix_3-backups"; label = "Phone Backups: Mi Mix 3";
          devices = [
            "dreamlogic" "mi_mix_3" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
        "${dataDir}/lg_g8s/calls" = {
          id = "sj28t-854ug"; label = "Phone Calls: LG G8s";
          devices = [
            "dreamlogic" "stowaway" "whatliesbelow" "whitetulip"
          ];
        };
      };
    };
  };
}
