class AddCountryIdToApp < ActiveRecord::Migration
  def change
    add_column :apps, :country_id, :integer
  end
end
