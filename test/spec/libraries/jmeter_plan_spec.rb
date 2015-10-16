require 'spec_helper'
require_relative '../../../libraries/jmeter_plan'

describe JmeterCookbook::Resource::JmeterPlan do
  step_into(:jmeter_plan)
  recipe 'jmeter::default'
  context 'with default properties' do

  end
end
