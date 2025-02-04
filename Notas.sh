================================================================================
### IVENTOY AUTOSTART
Como root

Crie um arquivo: nano /root/iventoy-helper.sh

#!/bin/bash

cd /home/linux/iventoy-1.0.20 && sh ./iventoy.sh -R start

crontab -e
@reboot sleep 10 && sh /root/iventoy-helper.sh
