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

	def android_time
		set_tab :android_time
		@@method = __method__
		c = set_country_from_params
		s = set_start_from_params
		e = set_end_from_params		

		@ratings = []
		app=App.find_by_name('txtr')
		
		@ratings = app.android_daily_rating_cum( s, e )	
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
		if !@country && params[:post]
			@country = params[:post][:country]
		end

		c = nil
		if !@country

		elsif (Float(@country) rescue false)
			c = Country.find_by_id(@country)
		else
			c = Country.find_by_name(@country)
		end

		@country="All" if !c
		@country
	end

	def set_start_from_params
		s = nil
				
		begin			
			s = Date.strptime(params[:start_date],"%d/%m/%Y") if params[:start_date]
		rescue Exception=>e
		end

		s = Date.strptime("20130919","%Y%m%d") if !s
		s
	end

	def set_end_from_params
		e = nil
		pp "oshie0"
		pp params[:end_date]		
		begin			
			e = Date.strptime(params[:end_date],"%d/%m/%Y") if params[:end_date]
		rescue Exception=>e
		end
		e = Date.strptime("20140101","%Y%m%d") if !e
		e
	end
end
