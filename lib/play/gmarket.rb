#!/bin/ruby

require 'rubygems'
require 'market_bot'
require 'pp'

def total(html)
	result = {}

    doc = Nokogiri::HTML(html)
    result[:total] = doc.
    result
end
# Download/parse the leaderboard.
#lb = MarketBot::Android::Leaderboard.new(:topselling_free, :game)
#lb.update

# Download/parse the details for the first and last entries of the leaderboard.
first_app = MarketBot::Android::App.new('com.amazon.kindle')
#last_app = MarketBot::Android::App.new(lb.results.last[:market_id])
first_app.update
#last_app.update
puts "First place app (#{first_app.title}) price: #{first_app.price} rating: #{first_app.rating} #{first_app.rating_distribution} "
#pp first_app
pp first_app.rating_distribution
pp first_app.rating_distribution[5]
pp first_app.votes

#puts "Last place app (#{last_app.title}) price: #{last_app.price}"