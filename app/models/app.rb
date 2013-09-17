class App < ActiveRecord::Base
	validates :name, presence: true
	has_many :android_ratings

end
