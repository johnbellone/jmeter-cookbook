#
# Cookbook: jmeter
# License: Apache 2.0
#
# Copyright 2014-2015, Bloomberg Finance L.P.
#

default['jmeter']['install_type'] = 'source'

default['jmeter']['version'] = '2.13'
default['jmeter']['source_url'] = 'http://www.us.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz'
default['jmeter']['source_checksum'] = '9fe33d3d6e381103d3ced2962cdef5c164a06fc58c55e247eadf5a5dbcd4d8fe'

default['jmeter']['package_name'] = 'jmeter'

default['nokogiri']['version'] = '1.6.7.1'
