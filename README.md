# packer-libvirt
Basic Packer templates for Vagrant and Libvirt

## Images:
* RHEL 6 Server
* RHEL 7 Server
* Centos 6 server
* Centos 7 Server
* Fedora 22 Workstation

## Howto

### Create Box

You can create box by using  [Packer](https://packer.io).

```
$ packer build centos-6-server-x86_64.json
```


### Import box to Vagrant

```
$ vagrant box list
$ vagrant box add boxes/rhel-6-server-x86_64.box --name rhel-6-server-x86_64
$ vagrant init rhel-6-server-x86_64
$ vagrant up
```

## License

Released under GNU / GPL, for more info see LICENSE file.

## Author

Frantisek Kolacek (<fkolacek@redhat.com>)
