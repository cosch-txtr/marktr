require "json"
require "net/http"
require "net/https"
require "uri"


class AppfiguresLoader

	def self.rank_now(app, c)
		id = app.itunes_appfig_id
		country = c.itunes_country
		date = DateTime.now.strftime("%Y-%m-%d")
		uri = URI.parse("https://api.appfigures.com/v2/ranks/#{id}/daily/#{date}/#{date}?countries=#{country}&tz=utc")
 	
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_PEER

		request = Net::HTTP::Get.new(uri.request_uri)
		request["X-Client-Key"] = ENV["APPFIG_APP_KEY"]
		request["Authorization"] = ENV["APPFIG_AUTH"]

		response = http.request(request)

		result = JSON.parse(response.body) if response.code == "200"

		if result && result["data"] && result["data"].size!=0		  
		  #puts uri
		  #pp result
		  #puts "#{result["data"][1]["category"]["device"]}"

		  { 
		  	:"#{result["data"][0]["category"]["device"]}" => result["data"][0]["positions"][0],
		  	:"#{result["data"][1]["category"]["device"]}" => result["data"][1]["positions"][0]
		  }
		else
		  puts response.inspect
		end
	end
	
end