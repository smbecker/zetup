wget -q https://installbuilder.com/installbuilder-enterprise-19.8.0-linux-installer.run -O installbuilder.run
chmod +x installbuilder.run
sudo ./installbuilder.run --unattendedmodeui minimal --mode unattended --installer-language en
rm installbuilder.run

if [ -f "$HOME/secrets/installbuilder/license.xml" ]; then
  cp "$HOME/secrets/installbuilder/license.xml" /opt/installbuilder-19.8.0/
fi