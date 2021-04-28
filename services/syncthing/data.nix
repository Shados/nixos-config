{ config, lib, pkgs, ... }:
with lib;
{
  services.syncthing = {
    declarative = {
      devices = {
        dap = {
          id = "5M7O2NR-PLA6D77-3IO7BY4-RD2TZVE-7KBS63J-ZF3DT4U-HD5E4SU-WQIIIAU";
        };
        dreamlogic = {
          addresses = [ "tcp://home.shados.net:22000" ];
          id = "DOXL73C-CUSNSZU-L2RMPH2-A72HBTQ-X6DKNFU-UTRQPA5-GYZDISE-HP75MQY";
        };
        inabsentia = {
          id = "PVEBK44-4N4QOX7-RDXABYQ-FIYJFSI-PNBQISX-YQVGRHV-CGA2P6N-IVXOAAC";
        };
        lg_g8s = {
          id = "H7TGIVN-IYMTGHV-73E7SEP-MP5YWY7-52QNQ4T-UZL73YC-TA5LEJR-4XWAMQO";
        };
        stowaway = {
          addresses = [ "tcp://stowaway.shados.net:22000" ];
          id = "IOLIFRQ-SCKCXRM-HXGGTMY-TB3GSAL-3HUGL4S-G3MOK6C-MOD6EDU-TYOTHA6";
        };
        whatliesbelow = {
          id = "F2H4ADC-YPHZ7HR-ZHKHU4N-VFIFCC4-ZTF2LUX-X7RIN3N-5NDVTSC-LORBLQT";
        };
        theroadnottaken = {
          id = "HZUS7FV-2IDGXML-KQ2J527-3LY4ERQ-RVRMSWG-MW64N4Z-MJKV5NR-KTNIEQE";
        };
      };
      folders = let inherit (config.services.syncthing) dataDir; in {
        "${dataDir}/notes" = {
          id = "notes"; label = "Notes";
          devices = [
            "dap" "dreamlogic" "inabsentia" "lg_g8s" "stowaway" "whatliesbelow" "theroadnottaken"
          ];
        };
        "${dataDir}/secure" = {
          id = "secure"; label = "Secure";
          devices = [
            "dap" "dreamlogic" "inabsentia" "lg_g8s" "stowaway" "whatliesbelow" "theroadnottaken"
          ];
        };
        "${dataDir}/photos/mi_mix_3" = {
          id = "mi_mix_3_exbj-photos"; label = "Main Phone Photos";
          devices = [
            "dreamlogic" "inabsentia" "lg_g8s" "stowaway" "whatliesbelow"
          ];
        };
        "${dataDir}/photos/dap" = {
          id = "lg-us998_c3tg-photos"; label = "DAP Photos";
          devices = [
            "dap" "dreamlogic" "inabsentia" "stowaway" "whatliesbelow"
          ];
        };
        "${dataDir}/MiMix3/calls" = {
          id = "eiqqp-3kag8"; label = "Mi Mix 3 Calls";
          devices = [
            "dreamlogic" "stowaway" "whatliesbelow"
          ];
        };
        "${dataDir}/lg_g8s/calls" = {
          id = "sj28t-854ug"; label = "LG G8s Calls";
          devices = [
            "dreamlogic" "lg_g8s" "stowaway" "whatliesbelow"
          ];
        };
      };
    };
  };
}
