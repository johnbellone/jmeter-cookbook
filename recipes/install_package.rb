#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: install_package
#
package node[:jmeter][:package_name] do
  version node[:jmeter][:version]
end
