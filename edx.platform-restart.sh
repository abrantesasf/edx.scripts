#!/bin/bash
# 
# Este script é um FORK do original, preparado por Lawrence McDaniel
# (https://github.com/lpm0073), para restartar a plataforma Open edX,
# mas somente o "core" da plataforma (LMS/CMS/EDXAPP_WORKERS).
#---------------------------------------------------------

# Restartar "core" do Open edX:
sudo /edx/bin/supervisorctl restart lms
sudo /edx/bin/supervisorctl restart cms
sudo /edx/bin/supervisorctl restart edxapp_worker:

# Ver o status após o restart:
sudo /edx/bin/supervisorctl status

# Restartar nginx:
sudo systemctl restart nginx

# Ver o status após o restart:
sudo systemctl status nginx
