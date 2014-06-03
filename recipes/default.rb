#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: default
#
include_recipe 'java::default'
include_recipe "jmeter::install_#{node[:jmeter][:install_type]}"

directory node[:jmeter][:testplan_dir]
jmeter_plan do
  threads count: 10 do
    visit name: 'Google Search', url: 'http://google.com'
  end
end
