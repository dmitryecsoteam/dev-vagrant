apt-get update

echo "------------ Adding ansible_user and SSH keys"
adduser --gecos "" --disabled-password ansible_user
echo "ansible_user:Qwerty12" | chpasswd
adduser ansible_user sudo
su -m "ansible_user" -c "ssh-keygen -b 2048 -t rsa -f /home/ansible_user/.ssh/id_rsa -N ''"
echo "ansible_user    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
