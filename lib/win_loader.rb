require 'nokogiri'
require 'open-uri'

class WinLoader

	def self.load(a)
		self.win8_load(self.win8_uri_for(a))
	end

private 
	def self.win8_uri_for(app)
		u="http://apps.microsoft.com/windows/"
		u+=app.win8_country
		u+="/app/"
		u+=app.win8_id
	end

	def self.win8_load(uri)
		doc= Nokogiri::HTML(open(uri))
	  node = doc.xpath("//meta[@itemprop='ratingValue']").first
	  rating = node[:content].strip rescue 'Free'
	
		node = doc.xpath("//meta[@itemprop='ratingCount']").first
		count = node[:content].strip rescue 'Free'
		{ :rating=>rating, :count=>count }
	end

end