from mhadhbixissam/ubuntu:vnc

run apt update 

##################################################
#                startup script                  #
##################################################
run <<EOF
echo -n '#!/bin/bash
set -euo pipefail
code-server --bind-addr 0.0.0.0:8000  --auth none /root/workspace & 
' > /root/.vnc/xstartup && chmod 700 /root/.vnc/xstartup 
EOF
