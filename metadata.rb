name 'jmeter'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
description 'Application cookbook which installs jmeter.'
long_description 'Application cookbook which installs jmeter.'
version '1.0.0'
issues_url 'https://github.com/johnbellone/jmeter-cookbook/issues' if defined?(issues_url)
source_url 'https://github.com/johnbellone/jmeter-cookbook' if defined?(source_url)

supports 'centos', '~> 6.4'
supports 'redhat', '~> 6.4'
supports 'ubuntu', '~> 12.04'

depends 'ark'
depends 'build-essential'
depends 'java'
depends 'poise', '~> 2.2'
