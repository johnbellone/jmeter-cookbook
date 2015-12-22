require 'chef/resource/ruby_block'

class Chef
  class Resource
    class JMeterPlan < Chef::Resource::RubyBlock
      self.resource_name = 'jmeter_plan'

      allowed_actions %i(
        run
      )

      default_action :run

      def path(arg = '/etc/jmeter/plans.d')
        set_or_return(
          :path,
          arg,
          kind_of: String
        )
      end
    end
  end
end
