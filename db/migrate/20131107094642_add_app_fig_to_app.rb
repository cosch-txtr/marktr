class AddAppFigToApp < ActiveRecord::Migration
  def change
    add_column :apps, :itunes_appfig_id, :string
    add_column :apps, :android_appfig_id, :string
  end
end
