# main source: https://github.com/OCA/l10n-brazil/wiki/Instala%C3%A7%C3%A3o-Odoo-v8-em-Ubuntu-Server-14.04-LTS
echo "configuring postgresql - type a password for the database user when requested:"
sudo adduser --system --home=/opt/odoo --group odoo
sudo apt-get install postgresql -y
sudo su - postgres
echo "Copy and paste each of the blocks separatelly followed by a RETURN

createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo

'After this step, type a Password'

psql postgres

update pg_database set datallowconn = TRUE where datname = 'template0';
\c template0
update pg_database set datistemplate = FALSE where datname = 'template1';
drop database template1;
create database template1 with template = template0 encoding = 'UTF8';
update pg_database set datistemplate = TRUE where datname = 'template1';
\c template1
update pg_database set datallowconn = FALSE where datname = 'template0';
\q

exit

"

echo "installing dependencies"
sudo apt-get install python-setuptools python-pip python-dev python-yaml python-feedparser python-geoip python-imaging python-pybabel python-unicodecsv wkhtmltopdf libxml2-dev libxmlsec1-dev python-argparse python-babel python-cups python-dateutil python-decorator python-docutils python-feedparser python-gdata python-gevent python-greenlet python-jinja2 python-libxslt1 python-lxml python-mako python-markupsafe python-mock python-openid python-passlib python-psutil python-psycopg2 python-pychart python-pydot python-pyparsing python-pypdf python-ldap python-yaml python-reportlab python-requests python-simplejson python-six python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-wsgiref python-xlwt python-zsi python-dev libpq-dev poppler-utils python-pdftools antiword -y
sudo pip install pyserial==2.7 psycogreen==1.0 pyusb==1.0.0b1 qrcode==5.0.1 Pillow==2.5.1 boto==2.38.0 oerplib==0.8.4 jcconv==0.2.3 pytz==2014.4 num2words
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin

echo "configuring odoo"
# sudo su - odoo -s /bin/bash
git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch /opt/odoo/.
sudo chown -R odoo: /opt/odoo/
sudo chmod -R 640 /opt/odoo/
#exit

sudo mv ~/odoo-with-PMIS/conf_step1 /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo
sudo mv ~/odoo-with-PMIS/odoo-server /etc/init.d/
sudo chmod 755 /etc/init.d/odoo-server
sudo chown root: /etc/init.d/odoo-server

sudo /etc/init.d/odoo-server start
cat /var/log/odoo/odoo-server.log
sudo update-rc.d odoo-server defaults
ps aux | grep odoo
