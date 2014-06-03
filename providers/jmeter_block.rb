#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: jmeter_block
#
class Chef
  class Provider
    class JmeterBlock < Chef::Provider
      def whyrun_supported?
        true
      end

      def load_current_resource
        true
      end

      #
      # Executes the supplied block against the `ruby-jmeter` gem DSL.
      #
      def action_run
        converge_by("execute the jmeter test plan #{@new_resource.name}") do
          rv = RubyJmeter.dsl_eval(RubyJmeter::ExtendedDSL.new, @new_resource.block)
          Chef::Log.info("#{@new_resource} called")

          @new_resource.path = node[:jmeter][:plan_dir] unless @new_resource.path

          rv.jmx({
            path: @new_resource.path,
            file: "#{@new_resource.name}.jmx",
            log: "#{@new_resource.name}.log",
            jtl: "#{@new_resource.name}.jtl"
          })
          Chef::Log.info("#{@new_resource.name}.jmx written to #{@new_resource.path}")
        end
      end

      alias :action_create :action_run
    end
  end
end
