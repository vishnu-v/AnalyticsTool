class HomeController < ApplicationController

	def index
		puts "***************Hello***************"
		ip = request.remote_ip
		puts "*********#{ip} ****************"
		request.user_agent =~ /Mobile|webOS/
		puts "***********#{request.user_agent}******************"
	end

	def products

	end

	def about_us

	end

	def contact_us

	end

end

