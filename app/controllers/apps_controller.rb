class AppsController < ApplicationController

	def all
		set_tab :all
		@ratings = []
		App.joined.each do |app|
			@ratings += app.joined_rating_country( app.default_country )
		end
	end

	def android
		set_tab :android
		@ratings = []
		App.android.each do |app|
			@ratings += app.android_ratings
		end
	end

	def itunes
		set_tab :itunes
		@ratings = []
		App.itunes.each do |app|
			@ratings += app.itunes_rating_country( app.default_country )
		end
	end

	def win8
		set_tab :win8
		@ratings = []
		App.win8.each do |app|
			@ratings += app.win8_rating_country( app.default_country )
		end
	end
end
