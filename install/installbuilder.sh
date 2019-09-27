wget -q https://installbuilder.bitrock.com/installbuilder-enterprise-19.8.0-linux-x64-installer.run
chmod +x installbuilder-enterprise-19.8.0-linux-x64-installer.run
sudo ./installbuilder-enterprise-19.8.0-linux-x64-installer.run --unattendedmodeui minimal --mode unattended --installer-language en
rm installbuilder-enterprise-19.8.0-linux-x64-installer.run

if [ -f "$HOME/secrets/installbuilder/license.xml" ]; then
  cp "$HOME/secrets/installbuilder/license.xml" /opt/installbuilder-19.8.0/
fi