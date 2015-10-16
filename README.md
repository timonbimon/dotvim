Timon's repository for synchronizing his vim configurations using pathogen and git submodules   
Credit to http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

Installation:

cd ~  
git clone http://github.com/timon/dotvim.git ~/.vim  
ln -s ~/.vim/vimrc ~/.vimrc  
cd ~/.vim  
git submodule update --init  

Installing plugin as submodule:  

cd ~/.vim  
mkdir ~/.vim/bundle  
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive  
git add .  
git commit -m "Install Fugitive.vim bundle as a submodule."  

Upgrading a plugin bundle:                    
                                              
cd ~/.vim/bundle/nameofplugin                 
git pull origin master                        
                                              
Upgrading all bundled plugins:                
                                              
git submodule foreach git pull origin master  

