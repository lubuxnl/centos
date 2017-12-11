#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
yum install -y java-1.8.0-openjdk-devel.x86_64
yum install -y bc
yum install -y --nogpgcheck https://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
yum install -y --nogpgcheck puppet
/opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri
/opt/puppetlabs/puppet/bin/gem install generate-puppetfile
sed -i '/secure_path/ s/$/:\/opt\/puppetlabs\/puppet\/bin/' /etc/sudoers
echo 'Defaults env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers.d/ssh-auth-sock
chmod 0440 /etc/sudoers.d/ssh-auth-sock
cat <<! >> /etc/profile.d/puppet-agent.sh

# Add /opt/puppetlabs/puppet/bin to the path for sh compatible users

if ! echo \$PATH | grep -q /opt/puppetlabs/puppet/bin ; then
  export PATH=\$PATH:/opt/puppetlabs/puppet/bin
fi
!
cat <<! > /etc/profile.d/java.sh
export JAVA_HOME=/etc/alternatives/java_sdk
!
