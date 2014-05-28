#
# Author:: John Bellone (<jbellone@bloomberg.net>)
# Copyright:: Copyright (C) 2014 Bloomberg Finance L.P.
#
# All rights reserved - Do Not Redistribute
# Cookbook Name:: jmeter
# Attribute:: default
#
default[:jmeter][:install_type] = 'source'

default[:jmeter][:source_url] = 'http://www.us.apache.org/dist/jmeter/binaries/apache-jmeter-2.11.tgz'
default[:jmeter][:source_checksum] = '84a4edefea3a829aa54ac3dd17570b9ba8daa75d5438f6bc378b596c00d723bb'

default[:jmeter][:package_name] = 'jmeter'
