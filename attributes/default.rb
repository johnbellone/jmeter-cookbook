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

default['jmeter']['version'] = '2.13'
default['jmeter']['source_url'] = 'http://www.us.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz'
default['jmeter']['source_checksum'] = '9fe33d3d6e381103d3ced2962cdef5c164a06fc58c55e247eadf5a5dbcd4d8fe'

default['jmeter']['package_name'] = 'jmeter'
