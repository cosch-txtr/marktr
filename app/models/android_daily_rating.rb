class AndroidDailyRating < ActiveRecord::Base
	belongs_to :app
	attr_accessor :rating_cum
	attr_accessor :votes_cum
end
