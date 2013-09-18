class CreateJoinedRatings < ActiveRecord::Migration
  def change
    create_table :joined_ratings do |t|
      t.string :itunes_id
      t.decimal :itunes_rating, precision: 7, scale: 2
      t.integer :itunes_votes
      t.string :android_id
      t.decimal :android_rating, precision: 7, scale: 2
      t.integer :android_votes
      t.references :app, index: true

      t.timestamps
    end
  end
end
