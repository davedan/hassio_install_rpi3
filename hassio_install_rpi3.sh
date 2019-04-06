sudo apt-get update 

echo "installing Docker Dependencies"
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ raspbian-$(lsb_release -cs) main"
sudo apt-get update       
curl -sSL https://get.docker.com | sh

echo "Installing dependencies"
sudo apt-get install apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat software-properties-common -y

sudo rm hassio_install
sudo wget https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install
sudo chmod +x hassio_install
sudo ./hassio_install -d /config/homeassistant -m raspberrypi3

echo "Portainer Installation - Cleaning current container ..."
sudo docker stop "Portainer"
sudo docker rm "Portainer"

echo "Portainer Installation - Cleaning images ..."
sudo docker images
sudo docker rmi portainer/portainer

echo "Portainer Installation - Downloading image ..."
sudo docker pull portainer/portainer
sudo docker images

echo "Portainer Installation - Creating the new container ..."
sudo docker run -d --name="Portainer" --restart="always" -d -p 1024:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
