name             'jmeter'
maintainer       'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license          'Apache 2.0'
description      'Installs/Configures jmeter for load-testing.'
long_description 'Installs/Configures jmeter for load-testing.'
version          '0.2.2'

%w(centos redhat).each do |name|
  supports name, '~> 7.0'
  supports name, '~> 6.4'
  supports name, '~> 5.8'
end

supports 'ubuntu', '= 10.04'
supports 'ubuntu', '= 12.04'
supports 'ubuntu', '= 14.04'

depends 'apt'
depends 'ark'
depends 'build-essential'
depends 'chef-sugar'
depends 'java'
depends 'poise'
