DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "running daily workers on #{Rails.env}"

@androids = Hash.new
@itunes = Hash.new
@win8s = Hash.new

def store_android_ratings
  puts "store_android_ratings: in"
  
  App.android.each do |app|    
      begin
        next if( app.android_today)
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
      rescue Exception=>e
        puts e.message  
        puts e.backtrace.inspect 
      end
  end
  puts "store_android_ratings: out"
end

def store_itunes_ratings
  puts "store_itunes_ratings: in"
  
  App.itunes.each do |app|    
      begin
        next if( app.itunes_today)
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
      rescue Exception=>e
        puts e.message  
        puts e.backtrace.inspect 
      end
  end

  puts "store_itunes_ratings: out"
end

def store_win8_ratings
  puts "store_win8_ratings: in"
  
  App.win8.each do |app|    
      begin
        next if( app.win8_today)
        puts "searching for:#{app.name}:#{app.win8_id}"
        win=WinLoader.load(app)
        puts "\t(#{app.name}) rating: #{win[:rating]} <- #{win[:count]}"
        
        r = app.win8_ratings.create( {
          :win8_id=>app.win8_id,
          :rating=>win[:rating],
          :votes=>win[:count]
          })
        @win8s["#{app.id}"]=r;
      rescue Exception=>e
        puts e.message  
        puts e.backtrace.inspect 
      end
  end
  puts "store_win8_ratings: out"
end

def store_joined_ratings
  puts "store_joined_ratings: in"
  
  App.joined.each do |app|    
    begin
      next if( app.joined_today)
      puts "searching for:#{app.name}"
      a = @androids["#{app.id}"]
      i = @itunes["#{app.id}"]
      w = @win8s["#{app.id}"]
      if (a && i)
        j=app.joined_ratings.create({
          :itunes_id=>i.itunes_id,
          :itunes_rating=>i.rating,
          :itunes_votes=>i.votes,
          :android_id=>a.android_id,
          :android_rating=>a.rating,
          :android_votes=>a.votes
          })
        if( w )
          j.win8_rating = w.rating
          j.win8_votes = w.votes
          j.save!
        end
        puts "  created joind rating"
      else
        puts "  can not find ios and android"
      end
    rescue Exception=>e
      puts e.message  
      puts e.backtrace.inspect 
    end
  end

  puts "store_joined_ratings: out"
end

store_android_ratings
store_itunes_ratings
store_win8_ratings
store_joined_ratings

puts "daily workers done...."

