# http://unix.stackexchange.com/questions/77136/xdg-open-default-applications-behavior/107508#107508
#$ xdg-mime query filetype tmp.txt
#text/plain
#$ xdg-mime query filetype foo.pdf 
#application/pdf
#$ xdg-mime query filetype $PWD
#inode/directory

# makes entry in ~/.local/share/applications/mimeapps.list
xdg-mime default zathura.desktop application/pdf
mkdir -p ~/.config/zathura
cp zathurarc ~/.config/zathura/
