DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "running daily workers on #{Rails.env}"

@androids = Hash.new
@itunes = Hash.new

def store_android_ratings
  puts "store_android_ratings: in"
  
  App.android.each do |app|    
      puts "searching for:#{app.name}:#{app.android_id}"
      m_app = MarketBot::Android::App.new(app.android_id)
      m_app.update
      puts "\t(#{m_app.title}) price: #{m_app.price} rating: #{m_app.rating} <- #{m_app.votes}"
      
      r = app.android_ratings.create( {
        :android_id=>app.android_id,
        :rating=>m_app.rating,
        :votes=>m_app.votes
        })
      @androids["#{app.id}"]=r;
  end
  puts "store_android_ratings: out"
end

def store_itunes_ratings
  puts "store_itunes_ratings: in"
  
  App.itunes.each do |app|    
      puts "searching for:#{app.name}:#{app.itunes_id}"
      res = ITunesSearchAPI.lookup(:id =>app.itunes_id,:country => app.itunes_country)
      if !res
        puts "  fallback to US store ... "
        res = ITunesSearchAPI.lookup(:id =>app.itunes_id,:country => "us") 
      end
      puts "\t(#{res["trackName"]}) price: #{res["price"]} rating: #{res["averageUserRating"]} <- #{res["userRatingCount"]}"
      
      r = app.itunes_ratings.create( {
        :itunes_id=>app.itunes_id,
        :rating=>res["averageUserRating"],
        :votes=>res["userRatingCount"]
        })
      @itunes["#{app.id}"]=r;
  end

  puts "store_itunes_ratings: out"
end

def store_joined_ratings
  puts "store_joined_ratings: in"
  
  App.android_itunes.each do |app|    
    puts "searching for:#{app.name}"
    a = @androids["#{app.id}"]
    i = @itunes["#{app.id}"]
    if (a && i)
      app.joined_ratings.create({
        :itunes_id=>i.itunes_id,
        :itunes_rating=>i.rating,
        :itunes_votes=>i.votes,
        :android_id=>a.android_id,
        :android_rating=>a.rating,
        :android_votes=>a.votes
        })
      puts "  created joind rating"
    else
      puts "  can not find ios and android"
    end
  end

  puts "store_joined_ratings: out"
end

store_android_ratings
store_itunes_ratings
store_joined_ratings


puts "daily workers done...."

