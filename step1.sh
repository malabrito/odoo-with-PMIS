sudo apt-get update -y
sudo apt-get dist-upgrade -y
cd /opt/odoo/install_files
mv -f bashrc ~/.bashrc
sudo chmod 755 /opt/odoo/install_files/step2.sh
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
echo "Exiting SSH... Please log in again and run install.sh"
exit
