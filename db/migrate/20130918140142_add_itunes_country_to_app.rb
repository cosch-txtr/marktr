class AddItunesCountryToApp < ActiveRecord::Migration
  def change
    add_column :apps, :itunes_country, :string
  end
end
