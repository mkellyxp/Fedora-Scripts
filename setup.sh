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