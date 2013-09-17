DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "running daily workers on #{Rails.env}"


def store_android_ratings
  puts "store_android_ratings: in"
  
  App.android.each do |app|    
      puts "searching for:#{app.name}:#{app.android_id}"
      m_app = MarketBot::Android::App.new('com.txtr.android')
      m_app.update
      puts "\t(#{m_app.title}) price: #{m_app.price} rating: #{m_app.rating} #{m_app.rating_distribution}"
      
      app.android_ratings.create( {
        :rating=>m_app.rating,
        :five=>m_app.rating_distribution[5],
        :four=>m_app.rating_distribution[4],
        :three=>m_app.rating_distribution[3],
        :two=>m_app.rating_distribution[2],
        :one=>m_app.rating_distribution[1]
        })
  end

  puts "store_android_ratings: out"
end


store_android_ratings


puts "daily workers done...."

