class CreateAndroidDailyRatings < ActiveRecord::Migration
  def change
    create_table :android_daily_ratings do |t|
      t.integer :app_id
      t.datetime :date
      t.decimal :rating, precision: 7, scale: 2
      t.integer :votes
      t.integer :country_id

      t.timestamps
    end
    add_index :android_daily_ratings, :app_id
  end
end
