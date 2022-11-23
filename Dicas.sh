#!/bin/bash
================================================================================
### TAMANHO DIRETORIOS
du -h --max-depth=1


================================================================================
### COMANDOS REDE

sudo arp-scan -I enp3s0 -l

sudo tcpdump -i enp3s0 -nn arp


================================================================================
### DATA INSTALACAO
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'


================================================================================
### EXTRACAO DE ARQUIVOS - COMPACTAR E DESCOMPACTAR

### EXTRAIR PARA UM LOCAL:
tar -xvzf abc.tar.gz -C /local/destino/

### EXTRAIR APENAS UM ARQUIVO:
tar -xz -f abc.tar.gz "./local/arquivo.txt"

### LISTAR ARUIVOS:
tar -tz -f arquivo.tar.gz

### COMPACTAR:
tar -cvzf compacftar.tar.gz compactar/

### DESCOMPACTAR:
tar -xvzf descompactar.tar.gz


================================================================================
### REMOVER IP KNOWN_HOSTS
ssh-keygen -f /home/usuario/.ssh/known_hosts -R 10.10.10.1


================================================================================
### HORARIO HARDWARE

### Ajustar horario do sistema:
date MMddhhmmAAAA ( Mes, dia, hora, minuto, ano)

### Ver horario BIOS:
hwclock -r

### Ajustar horario da BIOS conforme horario do sistema:
clock -w
ou
hwclock -w

### Ajustar horario do sistema conforme o horario da BIOS:
clock -s
ou
hwclock -s


================================================================================
### ALTERAR TIMEZONE UBUNTU SERVER

### Listar timezones:
timedatectl list-timezones

### Exemplo:
America/Sao_Paulo

### Setar timezone:
sudo timedatectl set-timezone America/Sao_Paulo


================================================================================
### VER TAMANHO DE UM BANCO MYSQL

SELECT table_schema "Database", ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "Size(MB)" FROM information_schema.tables GROUP BY table_schema;

### CORRIGIR TABELAS CORROMPIDAS:
cd /var/lib/mysql/BANCO
myisamchk -r -v -f <table name>

mysqlcheck --auto-repair -uUSUARIO -pSENHA BANCO

### ALTERA FUSO HORARIO MYSQL:

SET GLOBAL time_zone = '-03:00';

Sair e entrar novamente para verificar se alterou:

select now();


================================================================================
# MONTAR DIRETORIO SAMBA LINUX

//192.168.0.x/diretorio /local/destino cifs users,username=USUARIO,vers=1.0,password=SENHA,dir_mode=0777,file_mode=0777 0 0


================================================================================
### PROCURA E MOVE ARQUIVOS
find -name *ARQUIVO*.xml -exec cp {} /destino/ \;

### Procura e lista arquivos:
find -name *ARQUIVO*.xml -exec ls -lart {} \;


================================================================================
### PROCURA TEXTO NOS ARQUIVOS

find . -iname "*.xml" | while read f; do grep " " "$f"; done


