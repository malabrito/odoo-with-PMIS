sudo apt-get install nano git bash-completion -y
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo adduser --system --home=/opt/odoo --group odoo
mkdir /opt/odoo/install_files
git clone https://github.com/malabrito/odoo-with-PMIS.git /opt/odoo/install_files/.
mv -f /opt/odoo/install_files/bashrc .bashrc
sudo chmod 755 /opt/odoo/install_files/step1.sh
sudo chmod 755 /opt/odoo/install_files/step2.sh
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales
echo "Exiting SSH... Please log in again and run install.sh"
exit
