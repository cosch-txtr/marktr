class AddWin8ToJoinedRating < ActiveRecord::Migration
  def change
    add_column :joined_ratings, :win8_rating, :decimal, precision: 7, scale: 2
    add_column :joined_ratings, :win8_votes, :integer
  end
end
