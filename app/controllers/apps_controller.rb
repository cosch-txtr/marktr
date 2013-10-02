class AppsController < ApplicationController

	def all
		set_tab :all
		c = set_country_from_params
		@@method = __method__

		@ratings = []
		App.joined.each do |app|
			@ratings += app.joined_rating_country( c )
		end
	end

	def android
		set_tab :android
		c = set_country_from_params
		@@method = __method__

		@ratings = []
		App.android.each do |app|
			@ratings += app.android_ratings
		end
	end

	def itunes
		set_tab :itunes
		c = set_country_from_params
		@@method = __method__

		@ratings = []
		App.itunes.each do |app|
			@ratings += app.itunes_rating_country( c )
		end
	end

	def win8
		set_tab :win8
		c = set_country_from_params
		@@method = __method__

		@ratings = []
		App.win8.each do |app|
			@ratings += app.win8_rating_country( c )
		end
	end

	def exp
		set_tab :exp
		c = set_country_from_params
		@@method = __method__
		
		@app = params[:app]
		
		@ratings = []
		
		# if @app
		# 	app = App.find_by_name @app
		# 	@ratings += app.win8_ratings
		# else
			App.itunes.each do |app|			
				@ratings += app.itunes_rating_country( c ) 
			end
		#end
	end

	def country
		#c = set_country_from_params
		@method=@@method
		self.send( @@method )
	end

private
	def set_country_from_params
		@country = params[:country]	
		c = Country.find_by_name(@country)
		@country="All" if !c
		c
	end
end
