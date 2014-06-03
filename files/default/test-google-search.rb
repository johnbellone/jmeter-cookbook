#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'ruby-jmeter'

opts = {
  path: '/usr/bin/env jmeter',
  file: 'jmeter.jmx',
  log: 'jmeter.log',
  jtl: 'results.jtl'
}

test do
  threads count: 10 do
    visit name: 'Google Search', url: 'http://google.com'
  end
end.run(opts)
