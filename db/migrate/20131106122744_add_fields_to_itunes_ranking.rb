class AddFieldsToItunesRanking < ActiveRecord::Migration
  def change
    add_column :itunes_ranking, :device, :string
    add_column :itunes_ranking, :rank, :number
    add_column :itunes_ranking, :downloads, :number
  end
end
