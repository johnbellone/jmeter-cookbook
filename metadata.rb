name             'jmeter'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'Apache 2.0'
description      'Installs/Configures jmeter'
long_description 'Installs/Configures jmeter'
version          '0.1.0'

%w(centos redhat).each do |name|
  supports name, '= 6.5'
end

supports 'ubuntu', '= 12.04'

depends 'java'
depends 'ark'
depends 'chruby'
