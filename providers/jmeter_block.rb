#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: jmeter_dsl
#
require 'ruby-jmeter'
class Object; undef test; end

class Chef
  class Provider
    class JmeterBlock < Chef::Provider
      def whyrun_supported?
        true
      end

      def load_current_resource
        true
      end

      def action_run
        converge_by("execute the jmeter test plan #{@new_resource.name}") do
          RubyJmeter.dsl_eval(RubyJmeter::ExtendedDSL.new, @new_resource.block)
          Chef::Log.info("#{@new_resource} called")
        end
      end

      alias :action_create :action_run
    end
  end
end
