#!/bin/ruby
DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

require 'rubygems'
require "json"
require "net/http"
require "net/https"
require "uri"
require "pp"
 
uri = URI.parse("https://api.appfigures.com/v2/ranks/219555482/daily/2013-11-03/2013-11-03?countries=de&tz=utc")
 
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

request = Net::HTTP::Get.new(uri.request_uri)
request["X-Client-Key"] = ENV["APPFIG_APP_KEY"]
request["Authorization"] = ENV["APPFIG_AUTH"]

request.each_header do |key, value|
  p "#{key} => #{value}"
end
response = http.request(request)
 
puts ""
puts "request done - http code:#{response.code}"
puts ""

response.each_header do |key, value|
  p "#{key} => #{value}"
end

if response.code == "200"
  result = JSON.parse(response.body)
  
  result.each do |doc|
  	pp doc
    #puts "id:#{doc["id"]}" #reference properties like this
    #puts "#{doc}"# this is the result in object form    
    puts ""
    puts ""
  end

  puts result["dates"][0]+":"+"#{result["data"][0]["positions"][0]}"
else
  puts "ERROR!!!"
end