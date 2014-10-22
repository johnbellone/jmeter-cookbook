#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: plan
#
class Chef
  class Resource::JmeterPlan < Resource::RubyBlock
    include Poise

    def initialize(name, run_context=nil)
      super
      @resource_name = :jmeter_plan
    end

    actions(:run)
    attribute(:path, kind_of: String, default: lazy { node['jmeter']['plan_dir'] })
  end

  class Provider::JmeterPlan < Provider::RubyBlock
    include Poise

    def action_run
      Chef::Log.debug("#{new_resource.name} block is nil!") unless new_resource.block

      converge_by("execute the jmeter test plan #{new_resource.name}") do
        rv = ::RubyJmeter.dsl_eval(::RubyJmeter::ExtendedDSL.new, &new_resource.block)
        Chef::Log.info("#{new_resource.name} called")

        rv.jmx(file: ::File.join(new_resource.path, "#{new_resource.name}.jmx"))
        Chef::Log.info("#{new_resource.name}.jmx written to #{new_resource.path}")
      end
    end
  end
end
