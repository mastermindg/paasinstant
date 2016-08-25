require 'socket'
require 'timeout'

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
	end
end
