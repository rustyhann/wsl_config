# https://drasite.com/blog/Pimp%20my%20terminal#colorizing-the-terminal
# https://github.com/aristocratos/bashtop#installation
# https://github.com/sharkdp/bat

# Answers
# y y y y 2 1 4 3 2 1 3 2 3 4 2 2 1 n 1 y 

mkdir ~/Deb
mkdir ~/Repo

# ZSH Functions
cp -r ../ZshFunctions ~/
chmod 755 ~/ZshFunctions
echo '' >> ~/.zshrc
echo '# Functions' >> ~/.zshrc
echo 'fpath+=~/ZshFunctions' >> ~/.zshrc
echo 'autoload glog' >> ~/.zshrc

# LSD -> LSDeluxe
wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb --directory ~/
sudo dpkg -i ~/lsd_0.18.0_amd64.deb
echo '' >> ~/.zshrc
echo '# Alias' >> ~/.zshrc
echo 'alias ls="lsd --long --group-dirs first"' >> ~/.zshrc
echo 'alias tree="lsd --tree"' >> ~/.zshrc
source ~/.zshrc
mv ~/lsd_0.18.0_amd64.deb ~/Deb

# BashTop
cd ~/Repo
git clone 'https://github.com/aristocratos/bashtop.git' 'aristocratos/bashtop'
cd aristocratos/bashtop/DEB
sudo ./build
cd ~/
echo 'alias top="bashtop"' >> ~/.zshrc
source ~/.zshrc

# Bat
cd ~/
sudo apt install -y bat
echo 'alias bat="/usr/bin/batcat"' >> ~/.zshrc
source ~/.zshrc

# Alias
echo 'alias myip="curl http://ipecho.net/plain; echo"' >> ~/.zshrc
echo 'alias distro="cat /etc/*-release"' >> ~/.zshrc
source ~/.zshrc