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
        if( app.android_today!=nil && app.android_today.is_valid?)
          @androids["#{app.id}"]=app.android_today;
          next
        end

        puts "searching for:#{app.name}:#{app.android_id}"
        m_app = MarketBot::Android::App.new(app.android_id)
        m_app.update
        puts "\t(#{m_app.title}) price: #{m_app.price} rating: #{m_app.rating} <- #{m_app.votes}"
        
        r = (!app.android_today) ? app.android_ratings.create() : app.android_today
        
        r.android_id=app.android_id
        r.rating=m_app.rating
        r.votes=m_app.votes
        r.save!

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
        if( app.itunes_today!=nil && app.itunes_today.is_valid?)
          @itunes["#{app.id}"]=app.itunes_today;
          next
        end

        puts "searching for:#{app.name}:#{app.itunes_id}"
        res = ITunesSearchAPI.lookup(:id =>app.itunes_id,:country => app.itunes_country)
        if !res
          puts "  fallback to US store ... "
          res = ITunesSearchAPI.lookup(:id =>app.itunes_id,:country => "us") 
        end
        puts "\t(#{res["trackName"]}) price: #{res["price"]} rating: #{res["averageUserRating"]} <- #{res["userRatingCount"]}"
        
        r = (!app.itunes_today) ? app.itunes_ratings.create() : app.itunes_today

        r.itunes_id=app.itunes_id
        r.rating=res["averageUserRating"]
        r.votes=res["userRatingCount"]
        r.save!

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
        if( app.win8_today!=nil && app.win8_today.is_valid? )
          @win8s["#{app.id}"]=app.win8_today;
          next
        end

        puts "searching for:#{app.name}:#{app.win8_id}"
        win=WinLoader.load(app)
        puts "\t(#{app.name}) rating: #{win[:rating]} <- #{win[:count]}"
        
        r = (!app.win8_today) ? app.win8_ratings.create() : app.win8_today

        r.win8_id=app.win8_id
        r.rating=win[:rating]
        r.votes=win[:count]
        r.save!

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
      next if( app.joined_today!=nil && app.joined_today.is_valid?)

      puts "searching for:#{app.name}"
      a = @androids["#{app.id}"]
      i = @itunes["#{app.id}"]
      w = @win8s["#{app.id}"]
      if (a && i)

        j = (!app.joined_today) ? app.joined_ratings.create() : app.joined_today

        j.itunes_id=i.itunes_id
        j.itunes_rating=i.rating
        j.itunes_votes=i.votes
        j.android_id=a.android_id
        j.android_rating=a.rating
        j.android_votes=a.votes
        
        if( w )
          j.win8_rating = w.rating
          j.win8_votes = w.votes
        else
          j.win8_rating = "0.0"
          j.win8_votes = 0
        end

        j.save!
        
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

def ensure_one js
  while js.count>1
    js.delete(js.last)
  end
end

def ensure_only_one_per_day
  puts "ensure_only_one_per_day in"

  App.all.each do |app|
    j=app.joined_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
    ensure_one(j)

    a=app.android_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
    ensure_one(a)
    
    i=app.itunes_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
    ensure_one(i)
    
    w=app.win8_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
    ensure_one(w)    
  end

  puts "ensure_only_one_per_day out"
end

store_android_ratings
store_itunes_ratings
store_win8_ratings
store_joined_ratings
ensure_only_one_per_day

puts "daily workers done...."

