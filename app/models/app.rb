class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings
	has_many :itunes_ratings
	has_many :win8_ratings
	has_many :joined_ratings

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


	
	def joined_today
		j=joined_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		return j[0] if j.count>0
		nil
	end
	
	def android_today
		a=android_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		return a[0] if a.count>0
		nil
	end
	
	def itunes_today
		i=itunes_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		return i[0] if i.count>0
		nil
	end

	def win8_today
		w = win8_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		return w[0] if w.count>0
		nil
	end
end
