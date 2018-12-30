#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
yum install -y epel-release
yum install -y ansible ansible-doc python-pip python-nose tree
pip install --upgrade pip
pip install virtualenv
