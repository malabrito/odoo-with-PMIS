sudo apt-get install openssh-server nano git bash-completion -y
sudo apt-get update -y
sudo apt-get dist-upgrade -y
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
echo "Exiting SSH... Please log in again and run install.sh"
exit
