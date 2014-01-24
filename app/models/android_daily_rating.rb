class AndroidDailyRating < ActiveRecord::Base
	belongs_to :app
	attr_accessor :rating_cum
end
