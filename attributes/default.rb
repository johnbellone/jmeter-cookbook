#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Attribute:: default
#
default['jmeter']['install_type'] = 'source'
default['jmeter']['plan_dir'] = '/etc/jmeter/plans.d'

default['jmeter']['version'] = '2.11'
default['jmeter']['source_url'] = 'http://www.us.apache.org/dist/jmeter/binaries/apache-jmeter-2.11.tgz'
default['jmeter']['source_checksum'] = '84a4edefea3a829aa54ac3dd17570b9ba8daa75d5438f6bc378b596c00d723bb'

default['jmeter']['package_name'] = 'jmeter'
