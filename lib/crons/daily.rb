DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "running daily workers on #{Rails.env}"


def store_android_ratings
  puts "store_android_ratings: in"
  
  puts "store_android_ratings: out"
end

store_android_ratings

puts "daily workers done...."

