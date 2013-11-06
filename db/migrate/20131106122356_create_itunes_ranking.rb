class CreateItunesRanking < ActiveRecord::Migration
  def change
    create_table :itunes_ranking do |t|
      t.references :app, index: true

      t.timestamps
    end
  end
end
