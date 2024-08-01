#!/bin/bash

apt update && apt upgrade -y
apt install -y htop vim lnav fail2ban software-properties-common curl

swapoff -a
modprobe overlay -v
modprobe br_netfilter -v

cat <<EOF > /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward                 = 1
EOF
sysctl --system

cat <<EOF > /etc/update-motd.d/99-welcome-message 
#!/bin/bash
echo -e '\033[32mWelcome to riasloff.ru infrasrtucture\033[0m'
EOF
chmod +x /etc/update-motd.d/99-welcome-message

sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo sed -i 's/^bantime  = 10m/bantime  = 24h/' /etc/fail2ban/jail.conf


export KUBERNETES_VERSION=v1.30
export CRIO_VERSION=v1.30

curl -fsSL https://pkgs.k8s.io/core:/stable:/$KUBERNETES_VERSION/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$KUBERNETES_VERSION/deb/ /" |
    tee /etc/apt/sources.list.d/kubernetes.list

curl -fsSL https://pkgs.k8s.io/addons:/cri-o:/stable:/$CRIO_VERSION/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/cri-o-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/cri-o-apt-keyring.gpg] https://pkgs.k8s.io/addons:/cri-o:/stable:/$CRIO_VERSION/deb/ /" |
    tee /etc/apt/sources.list.d/cri-o.list

apt update
apt install -y cri-o kubelet kubeadm kubectl
apt-mark hold cri-o kubelet kubeadm kubectl

systemctl start crio.service fail2ban.service sshd.service
