#!/bin/sh
# 
# Este script é um FORK do original, preparado por Lawrence McDaniel
# (https://github.com/lpm0073), para a instalação de um servidor Open edX
# em um Ubuntu 16.04, 64 bits, rodando na Amazon.
#
# É feita uma instalação Native do Open edX, com todos os módulos e opções
# instalados por padrão, baseando-se na documentação em:
# https://openedx.atlassian.net/wiki/spaces/OpenOPS/pages/146440579/Native+Open+edX+Ubuntu+16.04+64+bit+Installation
#
# Execução: sudo nohup ./edx.platform-install.sh &
#---------------------------------------------------------

# Copia config.yml para HOME:
cp config.yml ~

# Vai para diretório HOME:
cd ~

# Por garantida, ajusta LOCALE:
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# 1. Configura a variável OPENEDX_RELEASE:
export OPENEDX_RELEASE=open-release/ironwood.master

# 2. Hora de levantar o Ansible:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/ansible-bootstrap.sh -O - | sudo -H bash

# 2.5 Ativa o ambiente virtual do Ansible:
. /edx/app/edx_ansible/venvs/edx_ansible/bin/activate

# 3. Hora de criar senhas aleatórias fortes, que serão utilizadas na
# instalação do Opne edX:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/generate-passwords.sh -O - | bash

# 4. Instalação do Open edX
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/native.sh -O - | bash > install.out
