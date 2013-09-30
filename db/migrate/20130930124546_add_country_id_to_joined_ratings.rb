class AddCountryIdToJoinedRatings < ActiveRecord::Migration
  def change
    add_column :joined_ratings, :country_id, :integer
  end
end
