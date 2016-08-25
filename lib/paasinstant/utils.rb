require 'socket'
require 'timeout'
require 'net/ssh'

module Paasinstant
	class Utils
		def port_open(ip, port, seconds=1)
		  # => checks if a port is open or not on a remote host
		  Timeout::timeout(seconds) do
		    begin
		      TCPSocket.new(ip, port).close
		      true
		    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
		      false
		    end
		  end
		  rescue Timeout::Error
		    false
		end

		def ssh_run(hostname, cmd)
			username = "root"
			begin
    			ssh = Net::SSH.start(hostname, username)
    			res = ssh.exec!(cmd)
    			ssh.close
    			puts res
  			rescue
    			puts "Unable to connect to #{@hostname} using #{@username}}"
  			end
		end
	end
end
