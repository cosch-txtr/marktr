DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts "#{Time.now} - running test workers on #{Rails.env}"

#c=Country.find_by_id(1)
#a=App.find_by_id(1)

#pp AppfiguresLoader.rank_now(a, a.default_country.itunes_country)
#pp AppfiguresLoader.downloads(a, a.default_country.itunes_country)
#pp AppfiguresLoader.total_downloads(a, a.default_country.itunes_country)

def store_itunes_rankings
  puts "store_itunes_rankings: in"
  
  App.itunes_ranking.each do |app|    
		Country.all.each do | country |
	    begin
		    #itunes = app.itunes_today(country)
		    #if( itunes!=nil && itunes.is_valid?)
		    #  @itunes["#{app.id}"]=itunes if itunes.country_id==app.default_country.id
		    #  next
		    #end

		    msg="searching for:#{app.name}:#{app.itunes_appfig_id}:"
		    msg+="#{country.itunes_country}" if country
		    c = country.itunes_country if country
		    puts msg
		    rank = AppfiguresLoader.rank_now(app.itunes_appfig_id, c )
		    dl = AppfiguresLoader.downloads(app.itunes_appfig_id, c)
		    tdl = AppfiguresLoader.total_downloads(app.itunes_appfig_id, c)
		    pp rank
		    pp dl
		    pp tdl

	    rescue Exception=>e
	      puts e.message  
	     	puts e.backtrace.inspect 
	    end
  	end
  end

  puts "store_itunes_rankings: out"
end

def store_play_rankings
  puts "store_play_rankings: in"
  
  App.android_ranking.each do |app|    
		Country.all.each do | country |
	    begin
		    #itunes = app.itunes_today(country)
		    #if( itunes!=nil && itunes.is_valid?)
		    #  @itunes["#{app.id}"]=itunes if itunes.country_id==app.default_country.id
		    #  next
		    #end

		    msg="searching for:#{app.name}:#{app.android_appfig_id}:"
		    msg+="#{country.itunes_country}" if country
		    c = country.itunes_country if country
		    puts msg
		    rank = AppfiguresLoader.rank_now(app.android_appfig_id, c )
		    dl = AppfiguresLoader.downloads(app.android_appfig_id, c)
		    tdl = AppfiguresLoader.total_downloads(app.android_appfig_id, c)
		    pp rank
		    pp dl
		    pp tdl

	    rescue Exception=>e
	      puts e.message  
	     	puts e.backtrace.inspect 
	    end
  	end
  end

  puts "store_play_rankings: out"
end

store_itunes_rankings
store_play_rankings

puts "#{Time.now} - test workers done...."


