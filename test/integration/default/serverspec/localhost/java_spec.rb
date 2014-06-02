require 'spec_helper'

describe package('java') do
  it { should be_installed }
end
