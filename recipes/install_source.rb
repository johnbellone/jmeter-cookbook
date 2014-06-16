#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: install_source
#
include_recipe 'ark::default'

ark 'jmeter' do
  has_binaries ['bin/jmeter', 'bin/jmeter-server', 'bin/ApacheJMeter.jar']
  url node[:jmeter][:source_url]
  checksum node[:jmeter][:source_checksum]
  version node[:jmeter][:version]
  action :install
end
