echo " ===> Configuring ACNG"
echo "Acquire::http { Proxy \"http://acng-yyc.cloud.cybera.ca:3142\"; };"  > /etc/apt/apt.conf.d/01-acng

echo " ===> Installing base packages"
apt-get update
apt-get install -y curl wget git tmux

echo " ===> Configuring SSH"
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
restart ssh
mkdir -p /root/.ssh
cat > /root/.ssh/config <<EOF
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
EOF
mkdir -p /root/.ssh/
cp /vagrant/support/keys/adass.pem /root/.ssh/id_rsa
cp /vagrant/support/keys/adass.pub /root/.ssh/id_rsa.pub
chown root: /root/.ssh/*
chmod 0600 /root/.ssh/id_rsa

echo " ===> Installing OpenStack tools"
apt-get install -y python-novaclient python-glanceclient python-swiftclient python-keystoneclient python-cinderclient python-openstackclient

echo " ===> Installing Vagrant and Plugins"
cd /root
apt-get install -y ruby-dev build-essential libxslt-dev libxml2-dev
wget --quiet https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
dpkg -i vagrant*.deb
rm vagrant*.deb
vagrant plugin install vagrant-openstack-plugin
vagrant box add dummy https://github.com/cloudbau/vagrant-openstack-plugin/raw/master/dummy.box
vagrant plugin install vagrant-serverspec

echo " ===> Copying openrc files"
cp -a /vagrant/support/rc /root

echo " ===> Adding and Configuring Users for Workshop"
for user in `cat /vagrant/support/users.txt`
do
  useradd -m -s /bin/bash $user
  echo $user:$user | chpasswd
  cp -a /vagrant/support/exercises /home/$user
  mv /home/$user/exercises/ex-3/Vagrantfile.tmp /home/$user/exercises/ex-3/Vagrantfile
  sed -i -e "s/__NAME__/${user}/g" /home/$user/exercises/ex-3/Vagrantfile
  cp -a /vagrant/support/rc /home/$user
  mkdir -p /home/$user/.ssh/
  cp /vagrant/support/keys/adass.pem /home/$user/.ssh/id_rsa
  cp /vagrant/support/keys/adass.pub /home/$user/.ssh/id_rsa.pub
  cp -a /root/.vagrant.d /home/$user/
  chmod 0600 /home/$user/.ssh/id_rsa
  chown -R $user: /home/$user/
done
