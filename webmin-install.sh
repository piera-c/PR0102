#!/bin/bash
#actualizacion de repositorio
sudo apt update

#instalacion del curl
sudo apt install -y curl

#descarga del script del repositorio de webmin
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh

#configuracion del repo
sudo sh webmin-setup-repo.sh

#actualizacion de repositorios
sudo apt update

#instalacion del webmin
sudo apt-get install -y webmin --install-recommneds

#comprobacion del servicio
sudo systemctl status webmin

#comprobacion de la red
ip a

#configuracion del firewall
sudo ufw allow ssh
sudo ufw alow 10000/tcp
sudo ufw enable

#comprobacion del firewall
sudo ufw status

