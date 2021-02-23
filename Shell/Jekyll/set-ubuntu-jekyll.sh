sudo apt update
sudo apt -y upgrade
sudo apt -y install automake
sudo apt -y install bison
sudo apt -y install build-essential
sudo apt -y install curl
sudo apt -y install dh-autoreconf
sudo apt -y install gcc
sudo apt -y install git-core
sudo apt -y install gpp
sudo apt -y install imagemagick
sudo apt -y install libcurl4-openssl-dev
sudo apt -y install libffi-dev
sudo apt -y install libgdbm-dev
sudo apt -y install libncurses5-dev
sudo apt -y install libreadline-dev
sudo apt -y install libsqlite3-dev
sudo apt -y install libssl-dev
sudo apt -y install libtool
sudo apt -y install libxml2-dev
sudo apt -y install libxslt1-dev
sudo apt -y install libyaml-dev
sudo apt -y install make
sudo apt -y install ruby-full
sudo apt -y install sqlite3
sudo apt -y install zlib1g
sudo apt -y install zlib1g-dev

mkdir ~/tools
echo '' >> ~/.zshrc
echo '# Tools' >> ~/.zshrc
echo 'export PATH=$HOME/Tools'
source ~/.zshrc
cp ./resize-blog-images.sh ~/tools/resize-blog-images.sh

mkdir ~/jekyll
echo '' >> ~/.zshrc
echo '# Jekyll' >> ~/.zshrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.zshrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.zshrc
echo 'cd ~/Jekyll' >> ~/.zshrc
source ~/.zshrc

sudo gem update

gem install jekyll bundler