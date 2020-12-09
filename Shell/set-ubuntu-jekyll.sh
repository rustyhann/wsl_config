sudo apt update
sudo apt -y upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt -y install \
    automake \
    bison \
    build-essential \
    curl \
    dh-autoreconf \
    gcc \
    git-core \
    gpp \
    libcurl4-openssl-dev \
    libffi-dev \
    libgdbm-dev \
    libncurses5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    make \
    ruby-full \
    sqlite3 \
    zlib1g \
    zlib1g-dev

mkdir ~/jekyll

echo '' >> ~/.zshrc
echo '# Jekyll' >> ~/.zshrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.zshrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.zshrc
echo 'cd ~/jekyll' >> ~/.zshrc
source ~/.zshrc

sudo gem update

gem install jekyll bundler