class CreateWin8Ratings < ActiveRecord::Migration
  def change
    create_table :win8_ratings do |t|
      t.string :win8_id
      t.decimal :rating, precision: 7, scale: 2
      t.integer :votes
      t.references :app, index: true

      t.timestamps
    end
  end
end
