class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings
	has_many :itunes_ratings

	def self.android
		where("android_id not NULL").all
	end

	def self.itunes
		where("ios_id not NULL").all
	end

end
