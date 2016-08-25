require "paasinstant/version"
require "paasinstant/utils"
require 'json'
require 'paint'
require 'net/ssh'

module Paasinstant
	class Builder
		@data_hash = []
		def initialize(input_json)
			@utils = Utils.new
			file = File.read(input_json)
			@data_hash = JSON.parse(file)
		end

		# Check that SSH is available on nodes
		def testnodes
			@nodes = @data_hash['nodes']
			@nodes.each do |hostname, ipaddress|
				if !@utils.port_open(ipaddress, 22)
					puts Paint["error [NOT OPEN]: Port 22 is not open on host #{hostname}", :red]
  					puts "\tCheck your connectivity and try again"
  					exit 1
  				end
			end
			puts Paint["\tConnectivity to hosts confirmed", :green]
		end

		def provisionroles
			@roles = @data_hash['roles']
			@roles.each do |role, hosts|
				hosts.each do |host|
					input = host.split(',')
					input.each do |hostname|
						if role == "keepalived" || role == "haproxy"
							self.send("#{role}".to_sym, hostname)
						end
					end
				end
			end
		end

		# Install keepalived
		def keepalived(nodename)
			puts "Installing Keepalived to #{nodename}"
			cmd="ls -altr /"
			@utils.ssh_run(nodename,cmd)
		end


		# Install haproxy
		def haproxy(nodename)
			puts "Installing HAProxy to #{nodename}"
		end

		def runit
			puts Paint["--- PAAS Instant...let's get cranking! ----", :blue, :bright]
			puts
			#puts Paint["Test ssh is available on the nodes", :blue, :bright]
			#self.testnodes
			puts Paint["Provision the roles", :blue, :bright]
			self.provisionroles
		end
	end
end