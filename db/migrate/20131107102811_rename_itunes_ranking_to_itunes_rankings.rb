class RenameItunesRankingToItunesRankings < ActiveRecord::Migration
	def self.up
    	rename_table :itunes_ranking, :itunes_rankings
  	end

 	def self.down
    	rename_table :itunes_rankings, :itunes_ranking
 	end
end
