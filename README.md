# vagrant-aci-containers
###### Vagrant box for aci containers

> If you have an existing vagrant environment
```
cd vagrant-aci-containers/ubuntu-bionic
vagrant up
```

> If you are running it in a Cisco lab environment use, set the following environment variable before doing vagrant up
```
export PROVISION_CISCO=true
```

> If you have not used vagrant before, you can set one up on an ubuntu VM as follows
```sudo apt-get update
sudo apt-get install git virtualbox vagrant
vagrant init ubuntu/xenial64
```
