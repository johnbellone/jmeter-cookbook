require 'spec_helper'

describe package('java-1.6.0-openjdk') do
  it { should be_installed }
end
