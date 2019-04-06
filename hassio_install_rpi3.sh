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
sudo ./hassio_install -d /config/homeassistant -m raspberrypi3
