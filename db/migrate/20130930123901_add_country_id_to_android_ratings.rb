class AddCountryIdToAndroidRatings < ActiveRecord::Migration
  def change
    add_column :android_ratings, :country_id, :integer
  end
end
