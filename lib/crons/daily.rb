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


store_android_ratings


puts "daily workers done...."

