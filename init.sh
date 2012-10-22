#bash

apt-get update

apt-get remove -y ruby1.8 rubygems

apt-get install -y rubygems1.9.1 ruby1.9.3

gem install puppet

useradd --comment "Puppet" --no-create-home --system --shell /bin/false puppet
