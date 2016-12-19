sudo apt-get install openssh-server
sudo apt-get update
sudo apt-get dist-upgrade
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
echo "Exiting SSH... Please log in again and run install.sh"
exit
