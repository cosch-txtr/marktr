class AddWin8IdToApp < ActiveRecord::Migration
  def change
    add_column :apps, :win8_id, :string
  end
end
