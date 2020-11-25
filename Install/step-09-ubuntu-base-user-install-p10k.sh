installDirectory=$(echo $PWD)
cd ~/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i 's/robbyrussell/powerlevel10k\/powerlevel10k/' ~/.zshrc
cd $installDirectory