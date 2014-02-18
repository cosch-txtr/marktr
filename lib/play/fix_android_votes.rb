#!/bin/ruby
DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

r0= AndroidRating.where("created_at between ? and ?", "2014-02-11", "2014-02-12")
r1= AndroidRating.where("created_at between ? and ?", "2014-02-12", "2014-02-13")
r2= AndroidRating.where("created_at between ? and ?", "2014-02-13", "2014-02-14")
r3= AndroidRating.where("created_at between ? and ?", "2014-02-14", "2014-02-15")
r4= AndroidRating.where("created_at between ? and ?", "2014-02-15", "2014-02-16")
r5= AndroidRating.where("created_at between ? and ?", "2014-02-16", "2014-02-17")

puts "name (11/12/13/14/15/16"
r0.each_index do |i| 
  if (r4[i].votes > r5[i].votes)
  if r0[i].app.id==r1[i].app.id && r0[i].app.id==r2[i].app.id && r0[i].app.id==r3[i].app.id && r0[i].app.id==r4[i].app.id && r0[i].app.id==r5[i].app.id
    puts r0[i].app.name+"("+r0[i].votes.to_s+"/"+r1[i].votes.to_s+"/"+r2[i].votes.to_s+"/"+r3[i].votes.to_s+"/"+r4[i].votes.to_s+"/"+r5[i].votes.to_s+")"
    step = r3[i].votes - r2[i].votes
    r=r4[i]
    r.votes = r3[i].votes+step
    r.save!
    puts r0[i].app.name+"("+r0[i].votes.to_s+"/"+r1[i].votes.to_s+"/"+r2[i].votes.to_s+"/"+r3[i].votes.to_s+"/"+r.votes.to_s+"/"+r5[i].votes.to_s+")"
  end
  end
end

