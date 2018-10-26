{ config, pkgs, lib, ... }:

let 
  cfg = config.fragments.router;
in

lib.mkIf (cfg.enable && cfg.enableDhcp) {
  services.dnsmasq = {
    enable = true;
    servers = config.networking.nameservers;
    extraConfig = ''
      interface=${cfg.intBridge}
      dhcp-range=${cfg.intSubnet + "." + toString (builtins.elemAt cfg.dhcpRange 0)},${cfg.intSubnet + "." + toString (builtins.elemAt cfg.dhcpRange 1)},12h
      # https://serverfault.com/questions/255487/excessive-dhcp-requests-in-var-log-messages-dhcpinform-dhcpack-and-dhcpreques
      dhcp-option=252,"\n"
    '';
  };

  networking.nft-firewall.inet.filter.lan-fw.rules = lib.mkOrder 1000 ''
    tcp dport 53 accept
    udp dport { 53, 67, 68} accept
  '';


  # TODO: Nov 13 20:55:49 l1.shados.net dnsmasq[22485]: dnsmasq: cannot open or create lease file /var/lib/misc/dnsmasq.leases: No such file or directory 
}
