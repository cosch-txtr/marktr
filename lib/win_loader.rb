require 'nokogiri'
require 'open-uri'

class WinLoader

	def self.load(a,c)
		self.win8_load(self.win8_uri_for(a,c))
	end

private 
	def self.win8_uri_for(app,country)
		u="http://apps.microsoft.com/windows/"
		u+=country
		u+="/app/"
		u+=app.win8_id
	end

	def self.win8_load(uri)
		doc= Nokogiri::HTML(open(uri))
	  	node = doc.xpath("//meta[@itemprop='ratingValue']").first
	  	rating = node[:content].strip rescue '0'
	  	rating=rating.gsub(/,/,".")
		
		node = doc.xpath("//meta[@itemprop='ratingCount']").first
		count = node[:content].strip rescue '0'
		{ :rating=>rating, :count=>count }
	end

end