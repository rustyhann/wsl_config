# https://drasite.com/blog/Pimp%20my%20terminal#colorizing-the-terminal
# https://github.com/aristocratos/bashtop#installation
# https://github.com/sharkdp/bat

# Directories
mkdir ~/Deb
mkdir ~/Repo
mkdir ~/Scripts
mkdir ~/Scripts/Terminal

# Install zsh
sudo apt-get install -y zsh
curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh' \
    --output ~/Scripts/Terminal/oh-my-zsh.install.sh
chmod +x ~/Scripts/Terminal/oh-my-zsh.install.sh
~/Scripts/Terminal/oh-my-zsh.install.sh --unattended
chsh -s $(which zsh)

# ZSH Functions
cp -r ./ZshFunctions/ ~/ZshFunctions
chmod 755 ~/ZshFunctions
echo '' >> ~/.zshrc
echo '# Functions' >> ~/.zshrc
echo 'fpath+=~/ZshFunctions' >> ~/.zshrc
echo 'autoload glog' >> ~/.zshrc

# Bat
sudo apt install -y bat

# LSD -> LSDeluxe
wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb \
    --directory-prefix ~/Deb
sudo dpkg -i ~/Deb/lsd_0.18.0_amd64.deb

# BashTop
git clone 'https://github.com/aristocratos/bashtop.git' ~/Repo/aristocratos/bashtop
cd ~/Repo/aristocratos/bashtop/DEB
sudo ./build
cd ~/

echo '' >> ~/.zshrc
echo '# Alias' >> ~/.zshrc
echo 'alias ls="lsd --long --group-dirs first"' >> ~/.zshrc
echo 'alias tree="lsd --tree"' >> ~/.zshrc
echo 'alias top="bashtop"' >> ~/.zshrc
echo 'alias bat="/usr/bin/batcat"' >> ~/.zshrc
echo 'alias myip="curl http://ipecho.net/plain; echo"' >> ~/.zshrc
echo 'alias distro="cat /etc/*-release"' >> ~/.zshrc

# Install PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ~/.oh-my-zsh/custom/themes/powerlevel10k
sed -i 's@robbyrussell@powerlevel10k/powerlevel10k@' ~/.zshrc

# Answers
# y y y y 2 1 4 3 2 1 3 2 3 4 2 2 1 n 1 y
