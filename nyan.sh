export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y build-essential git
git clone https://github.com/klange/nyancat.git

cd nyancat
make && cd src

screen "/root/nyancat/scr/nyancat"