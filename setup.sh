# check selinux 
# Edit the /etc/selinux/config file as follows:
# SELINUX=permissive

sudo dnf install docker
sudo systemctl start docker
sudo systemctl enable docker

sudo docker pull mysql/mysql-server:5.7

sudo docker run --name=mysql1 --mount type=bind,src=/home/mkelly/Docker/mysql,dst=/var/lib/mysql -d mysql/mysql-server:5.7

sudo docker logs mysql1 2>&1 | grep GENERATED

# Then Run
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'n3wj3rs3y';

# dbeaver tips
# local mysql client:  /var/lib/flatpak/runtime/io.dbeaver.DBeaverCommunity.Client.mariadb/x86_64/stable/active/files/bin
# use 127.0.0.1 instead of localhost