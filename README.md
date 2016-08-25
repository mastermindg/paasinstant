# Paasinstant

The goal of this project is to template a modular Platform-As-A-Service system capable of Higly Available, Fault Tolerant scaling by using a variety of tools. This is strictly for lab environments and the initial testing will be done on Rasperry Pi's.


## Requirements
For now the script assumes that you have nodes already up and running with Docker. In the future we will add additional functionality like EC2 and Vagrant builds.
- Debian-type (apt) Linux nodes
- Docker 1.12

## Goals
- Scalable (can add more nodes at will)
- Highly-Available (you can reach any running nodes easily)
- Fault-Tolerant (nodes going down won't affect users' experiences)
- Replicatable (everything lives in code)

## Architecture
- Docker 1.12 for containers
- Keepalived for availibility
- HAProxy for load-balancing
- Docker Swarm for Service Discovery and scaling

### Demo Cluster
- 2 LB's (HAProxy, KeepaliveD)
- 2 Docker manager nodes
- 4 Docker worker nodes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paasinstant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paasinstant

Or run the Demo executable:

    $ exec/paasinstant demo/paas.json

## Usage

There's an executable under exe with the basics to get you started.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/paasinstant.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

