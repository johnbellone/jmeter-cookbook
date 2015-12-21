require 'chef/provider/ruby_block'

class Chef
  class Provider
    class JMeterPlan < Chef::Provider::RubyBlock
      provides :jmeter_plan if respond_to?(:provides)

      def whyrun_supported?
        true
      end

      def action_run
        dir_resource = Chef::Resource::Directory.new(new_resource.path, run_context)
        dir_resource.recursive(true)
        dir_resource.run_action(:create)

        gem_resource = Chef::Resource::ChefGem.new('ruby-jmeter', run_context)
        gem_resource.run_action(:install)

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
