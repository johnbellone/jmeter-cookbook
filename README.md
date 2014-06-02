jmeter-cookbook
===============
Configures a node for load-testing with [Apache JMeter][3].

# Requirements

## Platforms
Since the dependencies for this really boil down to the ability to
install the [Omnibus Chef][9] installer we are capable of supporting
nearly any platform that has that built for it. But for testing
purposes the approved platforms are locked at the latest, supported
versions of both [Enterprise Linux][7] and [Ubuntu Linux][8].
- CentOS 6.5, 5.8
- Ubuntu 14.04, 12.04

# Usage
This cookbook is designed to be flexible and light-weight. The goal
was to allow for easy configuration of [JMeter][3] on the target host
using a simple attributes file (JSON).

## Packaging
Because this cookbook utilizes [Berkshelf][4] it is very easy to
package up the cookbook, along with all of its dependencies, into a
tarball which can be fetched over HTTP and fed into [Chef Solo][5] or
[Chef Zero][6].

```sh
bundle install --binstubs
bin/berks package
```

## Configuration

## Chef Solo
```sh
chef-solo -j attributes.json -r http://blp.s3.amazonaws.com/jmeter-cookbooks.tar.gz
```

# Maintainers
- Author:: [John Bellone][1] [@johnbellone][2] (<jbellone@bloomberg.net>)
- Author:: Victor Rosero (<vrosero@bloomberg.net>)

[1]: https://github.com/johnbellone
[2]: https://twitter.com/johnbellone
[3]: http://jmeter.apache.org/
[4]: http://github.com/berkshelf/berkshelf
[5]: http://docs.opscode.com/chef_solo.html
[6]: https://github.com/opscode/chef-zero
[7]: http://centos.org
[8]: http://ubuntu.com
[9]: http://getchef.com
