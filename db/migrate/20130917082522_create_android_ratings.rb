class CreateAndroidRatings < ActiveRecord::Migration
  def change
    create_table :android_ratings do |t|
      t.string :android_id
      t.decimal :rating, precision: 7, scale: 2
      t.integer :votes
      t.references :app, index: true

      t.timestamps
    end
  end
end
