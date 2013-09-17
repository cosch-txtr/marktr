class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings

	def self.android
		where("android_id not NULL").all
	end

end
