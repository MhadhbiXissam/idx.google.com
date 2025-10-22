{ pkgs, ... }: {
  services.docker.enable = true;

  channel = "stable-23.11";

  packages = with pkgs; [
    python3
    gnumake
  ];

  env = {


  };

  idx.workspace.onStart = {
    docker-setup = ''
      if [ -d .git ]; then rm -rf .git; fi
      docker images -q | xargs -r docker rmi -f
      docker system prune -f  
      docker compose ps -q | grep . >/dev/null && docker compose down || echo "no runing docker comopose container"
      docker compose up --build 
    '';
  };
}
