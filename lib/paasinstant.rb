require "paasinstant/version"

module Paasinstant
	class Builder
		def initialize(input_json)
			@input_json = input_json
		end

		def processjson
			File.open(@input_json, 'r') do |f1|  
  				while line = f1.gets  
    				puts line  
  				end  
			end
		end

		def display
			puts "Here's what you entered: #{@input_json}"
		end
	end
end