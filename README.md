# Discovery-vagrant

This project aims to give discovery developpers a *ready to use*
development environment.

It is based on ```vagrant```.

The deployments uses [```devstack```](https://devstack.org) to provision the openstack instances.
It installs [```ROME```](https://github.com/BeyondTheClouds/rome) as well as a ```redis-server``` instance to serve as database backend.


# Deploy

## single Openstack

```
./deploy.sh
```

You can connect to the provisioned machine using :
```
vagrant ssh pop0
```
or use the dashboard : [http://141.10.10.141](http://141.10.10.141)

## multiple Openstack


```
./deploy_pop.sh
```

will add another instance, namely ```pop1``` of OpenStack to collaborate with the ```pop0``` instance. Currently it will add all the nova services showing how they can collaborate sharing the same DB and message queue.
