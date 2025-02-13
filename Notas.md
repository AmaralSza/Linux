================================================================================
### IVENTOY AUTOSTART
Como root

Crie um arquivo: nano /root/iventoy-helper.sh

~~~bash
#!/bin/bash

cd /home/linux/iventoy-1.0.20 && sh ./iventoy.sh -R start
~~~
crontab -e
@reboot sleep 10 && sh /root/iventoy-helper.sh


================================================================================
### ANYDESK NAO LIBERA ACESSO NAO SUPERVISIONADO

# Editar o arquivo:
sudo nano /etc/anydesk/system.conf 

# Adicionar a linha ao final:
ad.security.interactive_access=1

# Rodar:
anydesk-global-settings
