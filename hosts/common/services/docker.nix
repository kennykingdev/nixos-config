{ ... }:

{
  # networking.firewall.allowedTCPPorts = [ ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true; # rootless mode
    };
    daemon = {
      settings = {
        data-root = "/opt/docker";
      };
    };
  };

  # run some docker containers as systemd services
  # virtualisation.oci-containers = {
  #   backend = "docker";
  #   containers = {
  #     # foo = {
  #     #   # ...
  #     # };
  #   };
  # };
}
