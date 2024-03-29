
echo "------------ Adding ansible_user and SSH keys"
adduser --gecos "" --disabled-password ansible_user
echo "ansible_user:Qwerty12" | chpasswd
adduser ansible_user sudo
echo "ansible_user    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
su -m "ansible_user" -c "ssh-keygen -b 2048 -t rsa -f /home/ansible_user/.ssh/id_rsa -N ''"
printf "Host *\n  ForwardAgent yes\n" > /home/ansible_user/.ssh/config



echo "------------- Installing ansible"
apt-get update
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y




echo "------------- Installing git"
apt-get install git -y



echo "------------- Restarting ssh"
service ssh restart
