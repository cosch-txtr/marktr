class AppsController < ApplicationController

	def android
		@ratings = []
		App.android.each do |app|
			@ratings += app.android_ratings
		end
	end

	def itunes
		@ratings = []
		App.itunes.each do |app|
			@ratings += app.itunes_ratings
		end
	end
end
