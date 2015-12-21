require 'ruby-jmeter'

# HACK: Object#test is defined for RubyJmeter::ExtendedDSL.
class Object; undef test; end

jmeter_plan 'google-search' do
  block do
    threads count: 10 do
      visit name: 'Google Search', url: 'http://google.com'
    end
  end
end
