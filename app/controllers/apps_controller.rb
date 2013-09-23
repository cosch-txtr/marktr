class AppsController < ApplicationController

	def all
		set_tab :all
		@ratings = []
		App.joined.each do |app|
			@ratings += app.joined_ratings
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
			@ratings += app.itunes_ratings
		end
	end
end
