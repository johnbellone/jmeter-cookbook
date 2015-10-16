reuqire 'serverspec'
set :backend, :exec

describe file('/etc/jmeter/plans.d') do
  it { should be_directory }
end
