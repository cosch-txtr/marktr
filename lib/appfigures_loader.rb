require "json"
require "net/http"
require "net/https"
require "uri"


class AppfiguresLoader

	def self.rank_now(app, c)
		app_country(app,c)
		uri = URI.parse("https://api.appfigures.com/v2/ranks/#{@id}/daily/#{@date}/#{@date}?countries=#{@country}&tz=utc")
		
		response = do_request(uri)

		result = JSON.parse(response.body) if response.code == "200"

		if result && result["data"] && result["data"].size!=0		  
		  #puts uri
		  #pp result

		  { 
		  	:"#{result["data"][0]["category"]["device"]}" => result["data"][0]["positions"][0],
		  	:"#{result["data"][1]["category"]["device"]}" => result["data"][1]["positions"][0]
		  }
		else
		  puts response.inspect
		end
	end

	def self.downloads(app, c)
		app_country(app,c)
		uri=URI.parse("https://api.appfigures.com/v2/sales?start_date=#{@date}&end_date=#{@date}&granularity=daily&products=#{@id}");
		response = do_request(uri)

		result = JSON.parse(response.body) if response.code == "200"

		if result && result["downloads"] && result["updates"]		  
		  #puts uri
		  #pp result

		  { 
		  	:downloads => result["downloads"],
		  	:updates => result["updates"]
		  }
		else
		  puts response.inspect
		end
	end


	def self.total_downloads(app, c)
		app_country(app,c)
		uri=URI.parse("https://api.appfigures.com/v2/sales?products=#{@id}");
		response = do_request(uri)

		result = JSON.parse(response.body) if response.code == "200"

		if result && result["downloads"] && result["updates"]		  
		  #puts uri
		  #pp result

		  { 
		  	:total_downloads => result["downloads"],
		  	:total_updates => result["updates"]
		  }
		else
		  puts response.inspect
		end
	end


private
	
	def self.app_country( app, c )
		@id = app.itunes_appfig_id
		@country = c.itunes_country
		@date = DateTime.now.yesterday.strftime("%Y-%m-%d")
	end

	def self.do_request(uri)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_PEER

		request = Net::HTTP::Get.new(uri.request_uri)
		request["X-Client-Key"] = ENV["APPFIG_APP_KEY"]
		request["Authorization"] = ENV["APPFIG_AUTH"]

		http.request(request)
	end
end