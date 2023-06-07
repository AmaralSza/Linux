07/06/23
================================================================================
### TAMANHO DIRETORIOS
du -h --max-depth=1


================================================================================
### LISTA ARQUIVOS ORDENANDO POR TAMANHO
ls -lASh

### ORDEM REVERSA:
ls -LASHr


================================================================================
### COMANDOS REDE

sudo arp-scan -I enp3s0 -l

sudo tcpdump -i enp3s0 -nn arp


================================================================================
### IP FIXO
# Netplan:

nano /etc/netplan/00-installer-config.yaml

# Caso nao existir o arquivo gerar:
netplan generate

# This is the network config written by 'subiquity'
network:
  ethernets:
    eno1:
      addresses:
      - 192.168.0.XX/24
      gateway4: 192.168.0.XX
      nameservers:
        addresses:
        - 192.168.0.XX
        search:
        - DOMINIO.com
  version: 2
  
  # Testar a sintaxe do arquivo:
  netplan try
  
  # Aplicar:
  netplan apply
  
  
  # Interfaces:
  
  nano /etc/network/interfaces
  
auto eth0
iface eth0 inet static

address 192.168.0.XX
netmask 255.255.255.0
network 192.168.0.XX
gateway 192.168.0.XX
dns-nameserver 192.168.0.XX

# Aplicar:
/etc/init.d/networking restart


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

### COMPACTAR .zip:
zip compactar.zip arquivo1 arquivo2

### COMPACTAR DIRETORIO .zip:
zip -r compactar.zip /local/diretorio

### DESCOMPACTAR .zip:
unzip descompactar.zip

### ADICIONAR ARQUIVO AO ZIP:
zip compactado.zip arquivo3

### COMPACTAR DIRETORIO E ARQUIVOS RECURSIVAMENTE:
zip -r compactar.zip pasta/subpasta/



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
### TAMANHO DE UM BANCO POST

select datname, pg_size_pretty(pg_database_size(datname)) from pg_database;


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

find . -iname "*.xml" | while read f; do grep "texto a procurar" "$f"; done


================================================================================
### CRIAR E REMOVER LINK SIMBOLICO

### CRIAR
ln -s /local/do/arquivo/arquivo.sh /local/do/link/nomeDoLink

### REMOVER
rm /local/do/link/nomeDoLink

### UNLINK
unlink local/do/link/nomeDoLink
