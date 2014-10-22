jmeter-cookbook
===============
![Release](http://img.shields.io/github/release/johnbellone/jmeter-cookbook.svg)
[![Build Status](http://img.shields.io/travis/johnbellone/jmeter-cookbook.svg)][14]
[![Code Coverage](http://img.shields.io/coveralls/johnbellone/jmeter-cookbook.svg)][15]

Configures a system load-testing with [Apache JMeter][3].

# Requirements
There is a hard requirement of both Chef and Java for this package
to install. We accomplish installing both of these by using additional
dependency cookbooks which target the operating system family and
install the appropriate software from either the package management
system or a source URL. These settings are completely configurable
using [Chef JSON attributes][5] with either the Chef Solo or Chef
Zero commandline tools.

## Cookbooks
The dependency cookbooks are resolved automatically using the Berkshelf
commandline tool. They are also packaged so that Chef is able to work
appropriately from the commandline. Each cookbook can be configured
using the node attributes in the Chef JSON file.

The dependency cookbooks are:
- [Ark cookbook][12]
- [Chef Sugar cookbok][13]
- [Java cookbook][11]

## Platforms
Since the dependencies for this really boil down to the ability to
install the [Omnibus Chef][9] installer we are capable of supporting
nearly any platform that has that built for it. But for testing
purposes the approved platforms are locked at the latest, supported
versions of both [Enterprise Linux][7] and [Ubuntu Linux][8].
- CentOS (RedHat) 7.0, 6.5, 5.8
- Ubuntu 14.04, 12.04

# Usage
This cookbook is designed to be flexible and light-weight. The goal
was to allow for easy configuration of [JMeter][3] on the target host
using a simple attributes file (JSON). Additionally, a Ruby language
component is exposed so that custom test-plans can be written in
wrapper cookbooks. These test plans can be deployed with software
that Chef is configuring.

## Packaging
Because this cookbook utilizes [Berkshelf][4] it is very easy to
package up the cookbook, along with all of its dependencies, into a
tarball which can be fetched over HTTP and fed into [Chef Solo][5] or
[Chef Zero][6].

```sh
bundle install --binstubs
bin/berks package
```

All of the cookbook dependencies *must* be packaged in order for the
provisioning step to work properly. The easiest way to do this is
using the Berkshelf package command which will create a tarball that
can be uploaded to an HTTP endpoint. This endpoint can be fed into
the `chef-client` on the commandline.

## Test Plan
This cookbook embeds a Ruby plugin which allows for a test plan to be
described easily inside of a recipe. A few test plans are included as
files inside of this cookbook if you wish to run it manually. But
inside of the default recipe we create a test plan against Google.

```ruby
jmeter_plan 'google-search' do
  block do
    test do
      threads count: 10 do
        visit name: 'Google Search', url: 'http://google.com'
      end
    end
  end
end
```

This [lightweight resource provider][10] in Chef will automatically
generate a test plan that can be fed into JMeter on the
command-line. All of the test plans will land in the directory
specified by the `node[:jmeter][:plan_dir]` attribute. By default this
is `/etc/jmeter/plans.d`.

### Chef Zero
Using the [Chef Client][5] in [local mode][6] we can pass in
attributes to configure the JMeter installation on the local
machine. The dependency cookbooks can also be specified by a URL that
is accessible from the host machine. The following command will
install JMeter, with the attributes specified in the `attributes.json`
file, and with the dependency cookbooks that were packaged by running
the `berks package` command (above).

```sh
chef-client -z -j attributes.json -r http://blp.s3.amazonaws.com/jmeter-cookbooks.tar.gz
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
[10]: http://docs.opscode.com/lwrp.html
[11]: https://github.com/socrata-cookbooks/java
[12]: https://github.com/sethvargo-cookbooks/chef-sugar
[13]: https://github.com/opscode-cookbooks/ark
[14]: http://travis-ci.org/johnbellone/jmeter-cookbook
[15]: https://coveralls.io/r/johnbellone/jmeter-cookbook
