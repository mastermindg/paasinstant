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
			alert = "connecting to #{hostname} using #{username}" 
			begin
    			Net::SSH.start(hostname, username, :timeout => 4) do |ssh|
    				res = ssh.exec!(cmd)
    				ssh.close
    				puts res
    			end
  			rescue Net::SSH::ConnectionTimeout
    			puts "\tTimed out #{alert}"
  			rescue Errno::EHOSTUNREACH
    			puts "\tHost unreachable #{alert}"
  			rescue Errno::ECONNREFUSED
    			puts "\tConnection refused #{alert}"
  			rescue Net::SSH::AuthenticationFailed
    			puts "\tAuthentication failure #{alert}"
  			end
		end
	end
end
