class AddCountryIdItunesRating < ActiveRecord::Migration
  def change
  	add_column :itunes_ratings, :country_id, :integer
  end
end
