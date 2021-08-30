cat << EOF
    I'm done re-install many times by typring, so, here we gooo
EOF

if (( $EUID != 0 )); then
    echo "Please run as root, byee...."
    exit
fi

if which docker >/dev/null; then
    echo "docker found"
else
    echo "docker not found"
    echo "...installing docker"
    wget https://raw.githubusercontent.com/criticalfail/configuration-ubuntu/main/docker-install.sh -O - | sudo -E bash
fi

if which docker-compose >/dev/null; then
    echo "docker-compose found"
else
    echo "docker-compose not found"
    echo "...installing docker-compose"
    wget https://raw.githubusercontent.com/criticalfail/configuration-ubuntu/main/docker-compose-install.sh -O - | sudo -E bash
fi

echo "getting tutor"
sudo curl -L "https://github.com/overhangio/tutor/releases/download/v12.0.4/tutor-$(uname -s)_$(uname -m)" -o /usr/local/bin/tutor
sudo chmod 0755 /usr/local/bin/tutor


