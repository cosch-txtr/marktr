#!/bin/ruby
DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

require 'rubygems'
require "pp"
require "csv"
require 'date'

debug=false
#STARTDATE = Date.strptime("20130919","%Y%m%d")
#ENDDATE = Date.today.next_day
STARTDATE = Date.strptime("20130930","%Y%m%d")
ENDDATE = Date.strptime("20140101","%Y%m%d")

txtr=App.find_by_name("txtr")

puts "For app:"+txtr.name

overall_r=0
overall_v=0

day = { :date=>"", :rating=>0.0, :votes=>0 }
CSV.foreach("com.txtr.android_overall_ratings_6M.csv") do |row|
  next if (!row[0] || row[0]=="date" || row[0].start_with?("#"))

  pp row if debug
  day[:date]=row[0]
  day[:rating]=Float(row[1])
  
  date = Date.strptime(day[:date],"%Y%m%d")
  next if date > ENDDATE || date < STARTDATE

  puts "found rating:#{day[:rating]}: for #{day[:date]}"
  pp day if debug

  votes_day = 0
  datetmp = date
  while votes_day==0 && datetmp>STARTDATE
  	android_ratings=txtr.android_ratings.where("created_at between ? and ? ", datetmp, datetmp.next_day)
  	votes_day = android_ratings[0][:votes] if (android_ratings && android_ratings[0])
  	datetmp = datetmp.prev_day
  	puts "  advancing back: "+datetmp.to_s if votes_day==0
  end

  next if datetmp<STARTDATE

  votes_day_after = 0
  datetmp = date
  while (votes_day_after==0 || votes_day_after==votes_day) && datetmp<ENDDATE
  	android_ratings=txtr.android_ratings.where("created_at between ? and ? ", datetmp.next_day, datetmp.next_day.next_day)
  	votes_day_after = android_ratings[0][:votes] if (android_ratings && android_ratings[0])
  	datetmp = datetmp.next_day
  	puts "  advancing forward: "+datetmp.to_s if votes_day_after==0 || votes_day_after==votes_day
  end

  next if datetmp>ENDDATE
    
  votes = votes_day_after - votes_day
  day[:votes]=votes  
  pp "  vda:"+votes_day_after.to_s	if debug
  pp "  vd :"+votes_day.to_s if debug
  puts "  based on #{day[:votes]} votes"

  for i in 1..day[:votes]
  	overall_r+=day[:rating]
  end
  overall_v+=day[:votes]
end

puts
puts 
puts "<================================"
puts "Overall:"
puts " rating: "+overall_r.to_s
puts " votes: "+overall_v.to_s
puts " ====>: "+(overall_r/overall_v).to_s
puts "<================================"