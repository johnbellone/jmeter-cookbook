#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014, 2015 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: plan
#
require 'chef/resource/ruby_block'
require 'chef/provider/ruby_block'

class Chef::Resource::JmeterPlan < Chef::Resource::RubyBlock
  self.resource_name = :jmeter_plan
  actions :run
  default_action :run

  attribute :path, kind_of: String, default: lazy { node['jmeter']['plan_dir'] }
end

class Chef::Provider::JmeterPlan < Chef::Provider::JmeterPlan
  use_inline_resources if defined?(use_inline_resources)
  provides :jmeter_plan

  action :run do
    if new_resource.block.nil?
      Chef::Log.debug("#{new_resource.name} jmeter_plan - block is not defined")
    end

    converge_by("#{new_resource.name} :run jmeter_plan") do
      rv = ::RubyJmeter.dsl_eval(::RubyJmeter::ExtendedDSL.new, &new_resource.block)
      rv.jmx(file: ::File.join(new_resource.path, "#{new_resource.name}.jmx"))
    end
  end
end
