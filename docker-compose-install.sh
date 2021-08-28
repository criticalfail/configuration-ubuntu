cat << EOF
    I'm done re-install many times by typring, so, here we gooo
EOF

if (( $EUID != 0 )); then
    echo "Please run as root, byee...."
    exit
fi

# get compose 
echo "# get compose "
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions
echo "# Apply executable permissions"
sudo chmod +x /usr/local/bin/docker-compose

# create a symbolic
echo "# create a symbolic"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Test the installation
echo "# Test the installation"
docker-compose --version
