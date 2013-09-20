class AddWin8CountryToApp < ActiveRecord::Migration
  def change
    add_column :apps, :win8_country, :string
  end
end
