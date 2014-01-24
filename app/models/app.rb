class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings
	has_many :itunes_ratings
	has_many :win8_ratings
	has_many :joined_ratings
	has_many :android_daily_ratings

	def default_country
		Country.find_by_id country_id
	end

	def itunes_country
		default_country.itunes_country
	end
	
	def win8_country
		default_country.win8_country
	end

	def android_country
		default_country.android_country
	end



	def self.joined
		where("android_id not NULL AND itunes_id not NULL").load
	end

	def self.android
		where("android_id not NULL").load
	end

	def self.itunes
		where("itunes_id not NULL").load
	end

	def self.win8
		where("win8_id not NULL").load
	end



	def android_rating_country( country )
		country = default_country if !country
		android_ratings.where("country_id = ?", country.id)
	end

	def itunes_rating_country( country )
		country = default_country if !country
		itunes_ratings.where("country_id = ?", country.id)
	end
	
	def joined_rating_country( country )
		country = default_country if !country
		joined_ratings.where("country_id = ?", country.id)
	end

	def win8_rating_country( country )
		country = default_country if !country
		win8_ratings.where("country_id = ?", country.id)
	end



	def joined_today( country=default_country )
		j=joined_ratings.where("created_at between ? and ? and country_id = ?", Date.today, Date.today.next_day, country.id)
		return j[0] if j.count>0
		nil
	end
	
	def android_today( country=default_country )
		a=android_ratings.where("created_at between ? and ? and country_id = ?", Date.today, Date.today.next_day, country.id)
		return a[0] if a.count>0
		nil
	end
	
	def itunes_today( country=default_country )
		i=itunes_ratings.where("created_at between ? and ? and country_id = ?", Date.today, Date.today.next_day, country.id)
		return i[0] if i.count>0
		nil
	end

	def win8_today( country=default_country )
		w = win8_ratings.where("created_at between ? and ? and country_id = ?", Date.today, Date.today.next_day, country.id)
		return w[0] if w.count>0
		nil
	end

	def android_daily_rating( date )
		a=android_daily_ratings.where("date between ? and ?", date, date.next_day)
		return a[0] if a.count>0
		nil
	end

	def android_daily_rating_cum( s, e )
		#a=android_daily_ratings.where("date between ? and ?", s, e)
		votes_cum=0;
		overall_v=0;
		overall_r=0;
		rating_cum=0;
		txtr=App.find_by_name("txtr");
		a = []
		pp "oshie"
		pp s
		pp e
		(s .. e ).to_a.each { |date|
			r = android_daily_rating(date)
			
			if r
				for i in 1..r.votes
			  	overall_r+=r.rating
			  end
			  overall_v+=r.votes
			  r.rating_cum=overall_r/overall_v
			else 
			   r = AndroidDailyRating.new
			   r.app=txtr
			   r.date=date
			   r.votes=0
			   r.rating=0
			   r.rating_cum=rating_cum
			end 
			rating_cum=r.rating_cum
			a.append r
		}
		a
	end
end
