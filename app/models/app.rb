class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings
	has_many :itunes_ratings
	has_many :joined_ratings

	def self.android_itunes
		where("android_id not NULL AND itunes_id not NULL").load
	end

	def self.android
		where("android_id not NULL").load
	end

	def self.itunes
		where("itunes_id not NULL").load
	end

end
