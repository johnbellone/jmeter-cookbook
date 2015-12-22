require 'spec_helper'
require_relative '../../../libraries/jmeter_plan_resource'
require_relative '../../../libraries/jmeter_plan_provider'

#### TODO: remove this once ark releases a version with their own matchers.rb
def install_ark(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:ark, :install, resource_name)
end
####

describe 'jmeter::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new().converge(described_recipe) }

  it 'installs jmeter' do
    expect(chef_run).to install_ark('jmeter')
  end
end
