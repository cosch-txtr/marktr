DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "running daily workers on #{Rails.env}"


def store_android_ratings
  puts "store_android_ratings: in"
  
  App.android.each do |app|    
      puts "searching for:#{app.name}:#{app.android_id}"
      m_app = MarketBot::Android::App.new(app.android_id)
      m_app.update
      puts "\t(#{m_app.title}) price: #{m_app.price} rating: #{m_app.rating} <- #{m_app.votes}"
      
      app.android_ratings.create( {
        :rating=>m_app.rating,
        :votes=>m_app.votes
        })
  end

  puts "store_android_ratings: out"
end

def store_itunes_ratings
  puts "store_itunes_ratings: in"
  
  App.itunes.each do |app|    
      puts "searching for:#{app.name}:#{app.ios_id}"
      res = ITunesSearchAPI.lookup(:id =>app.ios_id,:country => "de")
      if !res
        puts "  fallback to US store ... "
        res = ITunesSearchAPI.lookup(:id =>app.ios_id,:country => "us") 
      end
      puts "\t(#{res["trackName"]}) price: #{res["price"]} rating: #{res["averageUserRating"]} <- #{res["userRatingCount"]}"
      
      app.itunes_ratings.create( {
        :rating=>res["averageUserRating"],
        :votes=>res["userRatingCount"]
        })
  end

  puts "store_itunes_ratings: out"
end


store_itunes_ratings
store_android_ratings


puts "daily workers done...."

