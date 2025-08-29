================================================================================

### TAMANHO DIRETORIOS

```
du -h --max-depth=1
```

================================================================================

### VERSAO DO SISTEMA

```
lsb_release -a
```

================================================================================

### LISTA ARQUIVOS ORDENANDO POR TAMANHO

```
ls -lASh
```

- ORDEM REVERSA:

```
ls -LASHr
```

================================================================================

### COMANDOS REDE

```
sudo arp-scan -I enp3s0 -l
```

```
sudo tcpdump -i enp3s0 -nn arp
```

================================================================================

### IP FIXO

- Netplan:

```
nano /etc/netplan/00-installer-config.yaml
```

**Caso nao existir o arquivo gerar:**

```
netplan generate
```

```
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
```

- Testar a sintaxe do arquivo:

```
netplan try
```

- Aplicar:

```
netplan apply
```

- Interfaces:

```
nano /etc/network/interfaces
```

```
auto eth0
iface eth0 inet static

address 192.168.0.XX
netmask 255.255.255.0
network 192.168.0.XX
gateway 192.168.0.XX
dns-nameserver 192.168.0.XX
```

- Aplicar:

```
/etc/init.d/networking restart
```

================================================================================

### DATA INSTALACAO

```
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'
```

================================================================================

### EXTRACAO DE ARQUIVOS - COMPACTAR E DESCOMPACTAR

```
sudo apt-get install -y rar p7zip-full p7zip-rar p7zip
```

- EXTRAIR PARA UM LOCAL:

```
tar -xvzf abc.tar.gz -C /local/destino/
```

- EXTRAIR APENAS UM ARQUIVO:

```
tar -xz -f abc.tar.gz "./local/arquivo.txt"
```

- LISTAR ARUIVOS:

```
tar -tz -f arquivo.tar.gz
```

- COMPACTAR:

```
tar -cvzf compacftar.tar.gz compactar/
```

- DESCOMPACTAR:

```
tar -xvzf descompactar.tar.gz
```

- COMPACTAR .zip:

```
zip compactar.zip arquivo1 arquivo2
```

- COMPACTAR DIRETORIO .zip:

```
zip -r compactar.zip /local/diretorio
```

- DESCOMPACTAR .zip:

```
unzip descompactar.zip
```

- ADICIONAR ARQUIVO AO ZIP:

```
zip compactado.zip arquivo3
```

- COMPACTAR DIRETORIO E ARQUIVOS RECURSIVAMENTE:

```
zip -r compactar.zip pasta/subpasta/
```

================================================================================

### REMOVER IP KNOWN_HOSTS

```
ssh-keygen -f /home/usuario/.ssh/known_hosts -R 10.10.10.1
```

================================================================================

### ACESSAR HOST SEM SENHA SSH

- Metodo 01

```
ssh-copy-id usuario@192.168.X.XXX
```

- Metodo02

```
ssh-keygen
```

```
scp ~/.ssh/id_rsa.pub usuario@192.168.X.XXX:/tmp
```

- No host:

```
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
```

================================================================================

### ERRO SSH ANTIGOS

- no matching host key type found. Their offer: ssh-rsa,ssh-dss

** Solucao **

```
sudo nano /etc/ssh/ssh_config.d/my.conf
```

> HostKeyAlgorithms +ssh-rsa

```
ssh -o PubkeyAcceptedAlgorithms=+ssh-rsa 192.168.X.XXX
```

```
scp -o PubkeyAcceptedAlgorithms=+ssh-rsa arquivo.txt 192.168.X.XXX:/tmp
```

================================================================================

### HORARIO HARDWARE

- Ajustar horario do sistema:

```
date MMddhhmmAAAA ( Mes, dia, hora, minuto, ano)
```

- Ver horario BIOS:

```
hwclock -r
```

- Ajustar horario da BIOS conforme horario do sistema:

```
clock -w
```

ou

```
hwclock -w
```

- Ajustar horario do sistema conforme o horario da BIOS:

```
clock -s
```

ou

```
hwclock -s
```

================================================================================

### ALTERAR TIMEZONE UBUNTU SERVER

- Listar timezones:

```
timedatectl list-timezones
```

** Exemplo: **

> America/Sao_Paulo

- Setar timezone:

```
sudo timedatectl set-timezone America/Sao_Paulo
```

================================================================================

### VER TAMANHO DE UM BANCO MYSQL

```sql
SELECT table_schema "Database", ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "Size(MB)" FROM information_schema.tables GROUP BY table_schema;
```

- CORRIGIR TABELAS CORROMPIDAS:

```
cd /var/lib/mysql/BANCO
```

```
myisamchk -r -v -f <table name>
```

```
mysqlcheck --auto-repair -uUSUARIO -pSENHA BANCO
```

- ALTERA FUSO HORARIO MYSQL:

```sql
SET GLOBAL time_zone = '-03:00';
```

Sair e entrar novamente para verificar se alterou:

```sql
select now();
```

================================================================================

### TAMANHO DE UM BANCO POST

```sql
select datname, pg_size_pretty(pg_database_size(datname)) from pg_database;
```

================================================================================

### MONTAR DIRETORIO SAMBA LINUX

```
//192.168.0.x/diretorio /local/destino cifs users,username=USUARIO,vers=1.0,password=SENHA,dir_mode=0777,file_mode=0777 0 0
```

================================================================================

### PROCURA E MOVE ARQUIVOS

```
find -name *ARQUIVO*.xml -exec cp {} /destino/ \;`
```

### Procura e lista arquivos:

```
find -name *ARQUIVO*.xml -exec ls -lart {} \;
```

### PROCURA TEXTO NOS ARQUIVOS

```
find . -iname "*.xml" | while read f; do grep "texto a procurar" "$f"; done
```

================================================================================

### CRIAR E REMOVER LINK SIMBOLICO

- CRIAR

```
ln -s /local/do/arquivo/arquivo.sh /local/do/link/nomeDoLink
```

- REMOVER

```
rm /local/do/link/nomeDoLink
```

- UNLINK

```
unlink local/do/link/nomeDoLink
```

================================================================================

### SUBSTITUIR TEXTO COM SED

- Substiruir em um arquivo

```
sed -i 's/SubstiruirDe/SubstiruirPara/g' arquivo
```

- Substiruir em varios arquivos

```
find . -maxdepth 1 -type f -name '*.extensao' -exec sed -i 's/SubstiruirDe/SubstiruirPara/g' "{}" \;
```

- Altera uma tag de um arquivo

```
sed -i 's/<tag>SubstituirDe<\/tag>/<tag>SubstituirPara<\/tag>/g' arquivo.xml
```

- Altera uma tag de varios arquivos

```
find . -maxdepth 1 -type f -name '*.xml' -exec sed -i 's/<tag>SubstituirDe<\/tag>/<tag>SubstituirPara<\/tag>/g' "{}" \;
```

- Mostra arquivo com grep

```
find . -maxdepth 1 -type f -name '*.xml' -exec grep "<tag>texto</tag>" {} \;
```

- Conta quantos arquivos contem o texto

```
grep -l "<tag>texto</tag>" *.xml | wc -l
```

================================================================================

### REPETIR COMANDOS EM X SEGUNDOS NO TERMINAL

```
watch -n <segundos> <comando>
```

```
watch -n 5 df -h
```

================================================================================

### REDIMENSIONAR TAMANHO DISCO LVM

- Caso queira aumentar o LV e usar todo o espaço disponivel

```
lvresize -r -l+100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
```

- Caso queira aumentar um determinado tamanho, EX: 200G

```
lvresize -r -l +200G /dev/mapper/ubuntu--vg-ubuntu--lv
```

================================================================================

### VER SE E UM HDD OU SSD

```
cat /sys/block/sda/queue/rotational
```

> 0: O disco é um SSD.

> 1: O disco é um HDD.

================================================================================

### TESTAR HD

- Gerando relatorio

```
sudo badblocks -v /dev/sda1 >> bad-sectors.txt
```

- Simplesmente verifica cada bloco que pode ser lido, não testa por erros de escrita:

```
sudo badblocks -sv -c 1024 /dev/sda
```

- Metodo "non-destructive" que testa cada bloco lendo, escrevendo e verificando.

```
sudo badblocks -nsv -c 10240 /dev/sda
```

- Metodo write test - **APAGA TUDO**

```
sudo badblocks -wsv -c 10240 /dev/sdc >> bad-sectors.txt
```

================================================================================

### SSH REVERSO

- Servidor local

```
sudo nano /etc/ssh/sshd_config
```

> GatewayPorts yes

```
sudo service ssh restart
```

- Abrir tunel

```
ssh -R 2222:localhost:22 usuario@IP_REMOTO
```

- Acessar

1. Logar no SERVIDOR REMOTO

```
ssh -p 2222 userio@localhost
```

================================================================================

### MONTAR DIRETORIO DA REDE

- Se o servidor não permitir SMBv3, tente vers=2.0 ou vers=1.0

```
sudo mount -t cifs //server/disk2 /mnt/disk2 -o username=SEU_USUARIO,password=SUA_SENHA,vers=3.0
```

- Ou somente:

```
sudo mount -t cifs //server/disk2 /mnt/disk2 -o username=SEU_USUARIO
```

- Com dominio:

```
sudo mount -t cifs //server/disk2 /mnt/disk2 -o username=SEU_USUARIO,password=SUA_SENHA,domain=SEU_DOMINIO,vers=3.0
```

================================================================================

### JUNTAR ARQUIVOS .PDF

- Instalar o pdftk

```
sudo apt-get install pdftk
```

### Comandos

- Juntar arquivos

```
pdftk arquivo1.pdf arquivo2.pdf output arquivo_final.pdf
```

- Extrair páginas do arquivo

```
pdftk A=arquivo.pdf cat A1 output pagina1.pdf
```

```
pdftk A=arquivo1.pdf B=arquivo1.pdf cat A1-7 B2 output arquivo_final.pdf
```

================================================================================

### COMPACTAR VARIOS ARQUIVOS E MANTER NOME

```
for arquivo in *.BAK; do tar -czvf "${arquivo%.*}.tar.gz" "$arquivo"; done
```

================================================================================

### VERIFICAR IP EXTERNO

```
wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1
```

================================================================================

### CONFIGURAR NTP LOCAL COM SYSTEMCTL

```
sudo timedatectl set-ntp true
```

```
sudo nano /etc/systemd/timesyncd.conf

```

```
[Time]
NTP=192.168.0.X

```

```
sudo systemctl restart systemd-timesyncd
```

```
timedatectl
```

- Saida comum

```
Local time: sex 2025-08-29 10:13:54 -03
Universal time: sex 2025-08-29 13:13:54 UTC
RTC time: sex 2025-08-29 13:13:54
Time zone: America/Sao_Paulo (-03, -0300)
System clock synchronized: yes
NTP service: active
RTC in local TZ: no
```

```
journalctl -u systemd-timesyncd.service | grep '192.168.0.X'
```

================================================================================

### COPIAR VIA SCP USANDO RSYNC

```
rsync -avz --progress /disk2/ root@192.168.0.x:/disk2/
```
