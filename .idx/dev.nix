{ pkgs, ... }: {
  services.docker.enable = true;

  channel = "stable-23.11";

  packages = with pkgs; [
    python3
    gnumake
  ];

  env = {
    GIT_USER = "mhadhbixissam";

  };

  idx.workspace.onStart = {
    docker-setup = ''
      docker images -q | xargs -r docker rmi -f
      docker system prune -f  
      docker compose up --build


    '';
  };
}
