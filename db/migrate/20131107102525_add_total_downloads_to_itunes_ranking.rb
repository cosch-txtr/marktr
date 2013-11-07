class AddTotalDownloadsToItunesRanking < ActiveRecord::Migration
  def change
    add_column :itunes_ranking, :total_downloads, :number
  end
end
