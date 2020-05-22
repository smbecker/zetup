wget -q https://installbuilder.com/installbuilder-enterprise-20.4.0-linux-x64-installer.run -O installbuilder.run
chmod +x installbuilder.run
sudo ./installbuilder.run --unattendedmodeui minimal --mode unattended --installer-language en
rm installbuilder.run

if [ -f "$HOME/secrets/installbuilder/license.xml" ]; then
  cp "$HOME/secrets/installbuilder/license.xml" /opt/installbuilder-20.4.0/
fi