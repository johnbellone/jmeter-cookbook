require 'spec_helper'

describe file('/etc/jmeter/plans.d') do
  it { should be_directory }
end

describe file('/etc/jmeter/plans.d/google-search.jmx') do
  it {
    should exist
    should be_file
  }
  its(:content) {
    should contain '10'
    should contain 'Google Search'
    should contain 'google.com'
  }
end
