class AddCountryToItunesRanking < ActiveRecord::Migration
  def change
    add_column :itunes_rankings, :country_id, :number
  end
end
