echo "............    downloading Odoo 8.0 & Project Management Information System    ............"


sudo su - odoo -s /bin/bash
git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch .

mkdir /opt/odoo/modules
cd /opt/odoo/modules
git clone --recursive https://github.com/projectexpert/pmis.git
# git clone --recursive https://github.com/projectexpert/FULLPMIS.git

mkdir /opt/odoo/modules/oca
cd /opt/odoo/modules/oca
git clone https://github.com/oca/l10n-brazil.git --branch 8.0 --depth 1
git clone https://github.com/oca/account-fiscal-rule.git --branch 8.0 --depth 1

mkdir /opt/odoo/modules/odoo-brazil
cd /opt/odoo/modules/odoo-brazil
git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git --branch 8.0 --depth 1

#mkdir /opt/odoo/modules/extras
#cd /opt/odoo/modules/extras
#git clone https://github.com/stephane-/odoo_addons.git --branch 8.0

exit

echo "Installing dependencies files"
cd /tmp
git clone https://github.com/odoo-brazil/geraldo --branch master
cd geraldo
sudo python setup.py install
cd /tmp
wget http://labs.libre-entreprise.org/download.php/430/pyxmlsec-0.3.0.tar.gz
tar xvzf pyxmlsec-0.3.0.tar.gz
cd pyxmlsec-0.3.0
python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/PySPED.git --branch 8.0
cd PySPED
sudo python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/pyxmlsec --branch master
cd pyxmlsec
sudo python setup.py install



mkdir /opt/odoo/modules
cd /opt/odoo/modules
git clone --recursive https://github.com/projectexpert/pmis.git
# git clone --recursive https://github.com/projectexpert/FULLPMIS.git

mkdir /opt/odoo/modules/oca
cd /opt/odoo/modules/oca
git clone https://github.com/oca/l10n-brazil.git --branch 8.0 --depth 1
git clone https://github.com/oca/account-fiscal-rule.git --branch 8.0 --depth 1

mkdir /opt/odoo/modules/odoo-brazil
cd /opt/odoo/modules/odoo-brazil
git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git --branch 8.0 --depth 1

#mkdir /opt/odoo/modules/extras
#cd /opt/odoo/modules/extras
#git clone https://github.com/stephane-/odoo_addons.git --branch 8.0

exit

echo "Installing dependencies files"
cd /tmp
git clone https://github.com/odoo-brazil/geraldo --branch master
cd geraldo
sudo python setup.py install
cd /tmp
wget http://labs.libre-entreprise.org/download.php/430/pyxmlsec-0.3.0.tar.gz
tar xvzf pyxmlsec-0.3.0.tar.gz
cd pyxmlsec-0.3.0
python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/PySPED.git --branch 8.0
cd PySPED
sudo python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/pyxmlsec --branch master
cd pyxmlsec
sudo python setup.py install
