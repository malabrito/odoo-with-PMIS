sudo apt-get update -y
sudo apt-get dist-upgrade -y
mv -f odoo-with-PMIS/bashrc ~/.bashrc
sudo chmod 755 ~/odoo-with-PMIS/step2.sh
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
echo "Exiting SSH... Please log in again and run step2.sh"
exit
