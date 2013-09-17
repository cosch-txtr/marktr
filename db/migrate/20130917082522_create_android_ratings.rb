class CreateAndroidRatings < ActiveRecord::Migration
  def change
    create_table :android_ratings do |t|
      t.string :android_id
      t.decimal :rating, precision: 7, scale: 2
      t.integer :five
      t.integer :four
      t.integer :three
      t.integer :two
      t.integer :one
      t.references :app, index: true

      t.timestamps
    end
  end
end
