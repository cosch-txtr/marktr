class CreateItunesRatings < ActiveRecord::Migration
  def change
    create_table :itunes_ratings do |t|
      t.string :itunes_id
      t.decimal :rating, precision: 7, scale: 2
      t.integer :votes
      t.references :app, index: true

      t.timestamps
    end
  end
end
