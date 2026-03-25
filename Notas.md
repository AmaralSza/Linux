================================================================================

### IVENTOY AUTOSTART

**Como root**

Crie um arquivo:

```
nano /root/iventoy-helper.sh
```

```bash
#!/bin/bash

cd /home/linux/iventoy-1.0.20 && sh ./iventoy.sh -R start
```

crontab -e

```bash
@reboot sleep 10 && sh /root/iventoy-helper.sh
```

================================================================================

### ANYDESK NAO LIBERA ACESSO NAO SUPERVISIONADO

Editar o arquivo:

```
sudo nano /etc/anydesk/system.conf
```

Adicionar a linha ao final:

> ad.security.interactive_access=1

Executar o comando:

```
anydesk-global-settings
```

================================================================================

### DWSERVICE COM USUARIO PADRÃO

```
sudo systemctl stop dwagent
```

```
sudo nano /etc/systemd/system/dwagent.service
```

```ini
GNU nano 7.2 /etc/systemd/system/dwagent.service
[Unit]
Description=DWAgent
After=syslog.target network.target

[Service]
Type=forking
User=linux
Group=linux
ExecStart=/bin/sh -c '"/usr/share/dwagent/native/dwagsvc" start_internal'
ExecStop=/bin/sh -c '"/usr/share/dwagent/native/dwagsvc" stop_internal'

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl daemon-reload
```

```
sudo systemctl start dwagent
```
