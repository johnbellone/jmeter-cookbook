require 'spec_helper'

describe file('/usr/local/bin/jmeter') do
  it { should be_file }
  it { should be_executable }
  it { should be_linked_to('/usr/local/jmeter-2.11/bin/jmeter') }
end

describe file('/usr/local/bin/jmeter-server') do
  it { should be_file }
  it { should be_executable }
  it { should be_linked_to('/usr/local/jmeter-2.11/bin/jmeter-server') }
end
