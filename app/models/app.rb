class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings
	has_many :itunes_ratings
	has_many :win8_ratings
	has_many :joined_ratings

	
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
		j.count>0 && j[0].is_valid?	
	end
	
	def android_today
		a=android_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		a.count>0 && a[0].is_valid?	
	end
	
	def itunes_today
		i=itunes_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		i.count>0 && i[0].is_valid?	
	end

	def win8_today
		w = win8_ratings.where("created_at between ? and ?", Date.today, Date.today.next_day)
		w.count>0 && w[0].is_valid?	
	end
end
