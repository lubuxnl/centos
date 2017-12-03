#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
yum install -y --nogpgcheck https://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
yum install -y --nogpgcheck puppet
/opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri
/opt/puppetlabs/puppet/bin/gem install generate-puppetfile
sed -i '/secure_path/ s/$/:\/opt\/puppetlabs\/puppet\/bin/' /etc/sudoers
echo 'Defaults env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers.d/ssh-auth-sock
chmod 0440 /etc/sudoers.d/ssh-auth-sock
