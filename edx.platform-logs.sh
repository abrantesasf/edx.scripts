#!/bin/bash
#---------------------------------------------------------
# Por: Abrantes Araújo Silva Filho
#      http://abrantesfilho.com
#      abrantesasf@gmail.com
#---------------------------------------------------------

# Comandos para ver TODOS os logs do Open edX:
tail -f `sudo find /edx/var/log -name "*.log"`
