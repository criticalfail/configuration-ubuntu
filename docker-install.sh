cat << EOF
    I'm done re-install many times by typring, so, here we gooo
EOF

if (( $EUID != 0 )); then
    echo "Please run as root, byee...."
    exit
fi

# removing old installs
echo "# removing old installs"
sudo apt-get remove docker docker-engine docker.io containerd runc

# update 
echo "# update"
sudo apt-get update

# install requirements
echo "# install requirements"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# GPG key
echo "# GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# set up the stable repository
echo "# set up the stable repository"
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index
echo "# Update the apt package index"
sudo apt-get update

# ... and finally install
echo "# ... and finally install"
sudo apt-get install \
    docker-ce \
    docker-ce-cli \
    containerd.io

# for testing
echo "# for testing"
sudo docker run hello-world

# post installation for sudo removing
echo "# post installation for sudo removing"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# testing post-installation
echo "# testing post-installation"
docker run hello-world
