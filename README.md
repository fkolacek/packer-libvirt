# packer-libvirt
Basic Packer templates for Vagrant and Libvirt

## Create Box

You can create box by using  [Packer](https://packer.io).

``` $ packer build centos-6-server-x86_64.json```

## Import box to Vagrant

``` $ vagrant box list ```
``` $ vagrant box add boxes/rhel-6-server-x86_64.box --name rhel-6-server-x86_64 ```
``` $ vagrant init rhel-6-server-x86_64 ```
``` $ vagrant up ```
