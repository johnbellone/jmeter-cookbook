#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
# License:: Apache 2.0
#
# Cookbook Name:: jmeter
# Library:: jmeter_plan
#
class Chef
  class Resource
    class JmeterPlan < Chef::Resource::RubyBlock
      def initialize(name, run_context=nil)
        super

        @provider = Chef::Provider::JmeterBlock
        @resource_name = :jmeter_plan
      end
    end
  end
end
