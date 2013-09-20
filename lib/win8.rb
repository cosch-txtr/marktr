
require 'nokogiri'
require 'open-uri'
require 'pp'

#doc= Nokogiri::HTML(open("http://apps.microsoft.com/windows/de-de/app/txtr-reader/1e3b5a45-302f-4e99-a4d3-9a2371c2a395"))
doc= Nokogiri::HTML(open("http://apps.microsoft.com/windows/en-us/app/kindle/1d7e4396-0143-4aed-8892-84eb75e799f3"))

# ratings = doc.css('.Rating')

# ratings.each do |r|
#   pp r
#   puts "-------"
# 	field_name = r.css('.itemprop').text.strip
# 	puts field_name
# end

node = doc.xpath("//meta[@itemprop='ratingValue']").first
pp node

rating = node[:content].strip rescue 'Free'
pp rating

node = doc.xpath("//meta[@itemprop='ratingCount']").first
count = node[:content].strip rescue 'Free'
pp count