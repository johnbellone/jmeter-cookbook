require 'spec_helper'
require_relative '../../../libraries/jmeter_plan_resource'
require_relative '../../../libraries/jmeter_plan_provider'

describe Chef::Resource::JMeterPlan do
  step_into(:jmeter_plan)
  recipe 'jmeter::default'
  context 'with default properties' do

  end
end
