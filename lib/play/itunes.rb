#!/bin/ruby

require 'rubygems'
#require 'itunes'
require 'itunes-search-api'
require 'pp'


# res=ITunesSearchAPI.search(:term => "iBooks", :country => "de", :entity => "software", :limit=>10)

# pp res
# res.each do |r|
# 	puts r["trackName"]
# 	puts r["trackId"]
# 	puts r["trackViewUrl"]
# 	puts 
# end

r = ITunesSearchAPI.lookup(:id =>"364709193",:country => "us")

pp r
	puts r["trackName"]
	puts r["trackId"]
	puts r["trackViewUrl"]
