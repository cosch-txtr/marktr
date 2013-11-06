#!/bin/ruby

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
request["X-Client-Key"] = "9450455f8ae94ba290adb898ecdd8371"
request["Authorization"] = "Basic Y2hyaXN0aWFuLm9zY2h3YWxkQHR4dHIuY29tOnRlc3R0ZXN0" 

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