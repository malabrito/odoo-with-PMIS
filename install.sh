# main source: https://github.com/OCA/l10n-brazil/wiki/Instala%C3%A7%C3%A3o-Odoo-v8-em-Ubuntu-Server-14.04-LTS
echo "configuring postgresql"
sudo adduser --system --home=/opt/odoo --group odoo
sudo apt-get install postgresql -y
echo "type a password for postgres when requested:"
sudo su - postgres
createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo
exit
sudo -u postgres psql postgres
update pg_database set datallowconn = TRUE where datname = 'template0';
\c template0
update pg_database set datistemplate = FALSE where datname = 'template1';
drop database template1;
create database template1 with template = template0 encoding = 'UTF8';
update pg_database set datistemplate = TRUE where datname = 'template1';
\c template1
update pg_database set datallowconn = FALSE where datname = 'template0';


echo "installing dependencies"
sudo apt-get install python-dev python-yaml python-feedparser python-geoip python-imaging python-pybabel python-unicodecsv wkhtmltopdf libxml2-dev libxmlsec1-dev python-argparse python-babel python-cups python-dateutil python-decorator python-docutils python-feedparser python-gdata python-gevent python-greenlet python-jinja2 python-libxslt1 python-lxml python-mako python-markupsafe python-mock python-openid python-passlib python-psutil python-psycopg2 python-pychart python-pydot python-pyparsing python-pypdf python-ldap python-yaml python-reportlab python-requests python-simplejson python-six python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-wsgiref python-xlwt python-zsi python-dev libpq-dev poppler-utils python-pdftools antiword -y
sudo apt-get install python-pip -y
sudo apt-get install python-setuptools -y
sudo pip install pyserial==2.7
sudo pip install psycogreen==1.0
sudo pip install pyusb==1.0.0b1
sudo pip install qrcode==5.0.1
sudo pip install Pillow==2.5.1
sudo pip install boto==2.38.0
sudo pip install oerplib==0.8.4
sudo pip install jcconv==0.2.3
sudo pip install pytz==2014.4
sudo pip install num2words
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin
wkhtmltopdf --version

echo "downloading odoo"
sudo su - odoo -s /bin/bash
git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch .
exit
echo "configuring odoo"
sudo cp /opt/odoo/debian/openerp-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf
echo "
Altere 'db_password = False' para 'db_password = senha do postgres' (passo 6).
Modifique a linha 'addons_path = /usr/lib/python2.7/dist-packages/openerp/addons' para 'addons_path = /opt/odoo/addons'
Adicione a seguinte linha: logfile = /var/log/odoo/odoo-server.log"
sudo nano /etc/odoo-server.conf
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo
cd /etc/init.d/
sudo wget https://raw.githubusercontent.com/odoo/odoo/8.0/debian/init -O odoo-server
sudo chmod 755 /etc/init.d/odoo-server #Permissao para executar arquivo
sudo chown root: /etc/init.d/odoo-server #Usurio root como proprietrio do arquivo
echo "Altere:
DAEMON=/usr/bin/odoo.py mudar para diretório /opt/odoo/odoo.py
CONFIG=/etc/odoo/openerp-server.conf mudar para /etc/odoo-server.conf"
sudo nano /etc/init.d/odoo-server

echo "............    downloading Project Management Information System & OCA Brazilian localization files ............"

sudo su - odoo -s /bin/bash

mkdir /opt/odoo/modules
cd /opt/odoo/modules
# git clone https://github.com/projectexpert/pmis.git
git clone --recursive https://github.com/projectexpert/FULLPMIS.git

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


echo "Alterar:
addons_path = /opt/odoo/addons,/opt/odoo/openerp/addons,/opt/odoo/modules/pmis,/opt/odoo/modules/oca/l10n-brazil,/opt/odoo/modules/oca/account-fiscal-rule,/opt/odoo/modules/odoo-brazil/odoo-brazil-eletronic-documents,/opt/odoo/modules/oca/server-tools,/opt/odoo/modules/oca/purchase-workflow,/opt/odoo/modules/extras,/opt/odoo/modules/extras/odoo_addons,/opt/odoo/modules/extras/odoo_addons/gantt_improvement
"
sudo nano /etc/odoo-server.conf
sudo /etc/init.d/odoo-server start
cat /var/log/odoo/odoo-server.log
sudo update-rc.d odoo-server defaults
ps aux | grep odoo
