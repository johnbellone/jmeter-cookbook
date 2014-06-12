#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Recipe:: default
#
include_recipe 'chef-sugar::default'
include_recipe 'jmeter::install'

compile_time do
  chef_gem 'ruby-jmeter' do
    version "~> #{node[:jmeter][:version]}"
  end

  # HACK: Object#test is defined for RubyJmeter::ExtendedDSL.
  require_chef_gem 'ruby-jmeter'
  class Object; undef test; end
end

jmeter_plan 'google-search' do
  test do
    threads count: 10 do
      visit name: 'Google Search', url: 'http://google.com'
    end
  end
end
