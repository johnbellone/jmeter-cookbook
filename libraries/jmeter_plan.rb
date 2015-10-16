#
# Cookbook: jmeter
# License: Apache 2.0
#
# Copyright 2014-2015, Bloomberg Finance L.P.
#
require 'poise'

module JmeterCookbook
  module Resource
    class JmeterPlan < Chef::Resource::RubyBlock
      include Poise(fused: true)
      provides(:jmeter_plan)

      attribute(:path, kind_of: String, default: '/etc/jmeter/plans.d')

      action(:run) do
        directory new_resource.path do
          recursive true
        end

        if new_resource.block.nil?
          Chef::Log.debug("#{new_resource.name} jmeter_plan - block is not defined")
        end

        converge_by("#{new_resource.name} :run jmeter_plan") do
          rv = ::RubyJmeter.dsl_eval(::RubyJmeter::ExtendedDSL.new, &new_resource.block)
          rv.jmx(file: ::File.join(new_resource.path, "#{new_resource.name}.jmx"))
        end
      end
    end
  end
end
