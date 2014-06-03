#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: install
#

include_recipe 'java::default'
include_recipe "jmeter::install_#{node[:jmeter][:install_type]}"

directory node[:jmeter][:plan_dir]
