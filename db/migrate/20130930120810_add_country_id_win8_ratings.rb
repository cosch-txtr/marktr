class AddCountryIdWin8Ratings < ActiveRecord::Migration
  def change
  	add_column :win8_ratings, :country_id, :integer
  end
end
