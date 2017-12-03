@echo off
packer build -only=virtualbox-iso -var-file=centos7-desktop.json centos.json
vagrant box remove centos7-desktop
vagrant box add centos7-desktop file:///D:/Virtual%20Machines/Packer/centos/box/virtualbox/centos7-desktop-0.0.99.box rem --box-version 0.0.99