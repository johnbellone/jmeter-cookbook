#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: plan_resource
#
require 'chef/resource'

class Chef
  class Resource
    class JmeterPlan < Chef::Resource::RubyBlock
      def initialize(name, run_context=nil)
        super

        @provider = Chef::Provider::JmeterPlan
        @resource_name = :jmeter_plan
        @path = nil
      end

      def path(arg=nil)
        set_or_return(:path, arg, kind_of: [ String ])
      end

      alias :path= :path
      alias :test :block
    end
  end
end
