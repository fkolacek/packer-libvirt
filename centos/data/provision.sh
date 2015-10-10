#!/bin/bash

# Update first
yum -y update

# Set build date
date > /etc/vagrant_box_build_time

# Install Vagrant SSH key
mkdir -pm 700 /home/vagrant/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys && chown -R vagrant:vagrant /home/vagrant/.ssh

# Set SELINUX=permissive
setenforce 0
sed -i "s/^\(SELINUX=\).*/\1permissive/g" /etc/sysconfig/selinux

# Seal the system
sed -i "s/^\(HOSTNAME=\).*/\1localhost.localdomain/g" /etc/sysconfig/network
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth*
sed -i "/^UUID/d" /etc/sysconfig/network-scripts/ifcfg-eth*
rm -f /etc/ssh/ssh_host_*
rm -f /etc/udev/rules.d/70-persistent-net.rules
rm -f /var/lib/dhclient/dhclient-eth*.leases
rm -rf /tmp/*
yum -y clean all


#disable reverse dns lookups on sshd
echo "UseDNS no" >> /etc/ssh/sshd_config

exit 0
