# vagrant-aci-containers
**A vagrant environment for opflex based kubernetes install**

1. If you have not used vagrant before, please set it up first. On an ubuntu VM, you can set one up as follows
```
sudo apt-get update
sudo apt-get install git virtualbox vagrant
```
2. If you are running this code in a Cisco lab environment use, set the following environment variable (to set proxies)
```
export PROVISION_CISCO=true
```
3. Now clone the repo and run vagrant as
```
git clone https://github.com/noironetworks/vagrant-aci-containers.git
cd vagrant-aci-containers/ubuntu-bionic
vagrant up
```
