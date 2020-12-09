sudo apt update
sudo apt-get update
sudo apt -y install make 
sudo apt -y install build-essential 
sudo apt -y install ruby 
sudo apt -y install ruby-dev

echo '' >> ~/.zshrc
echo '# Jekyll' >> ~/.zshrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.zshrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

gem install jekyll bundler
