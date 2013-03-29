apt-get update
apt-get install -y build-essential git tmux screen
git clone https://github.com/klange/nyancat.git

cd nyancat
make && cd src
tmux new-session -d 'nyancat' \; split-window -d \; attach