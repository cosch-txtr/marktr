class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :itunes_id
      t.string :android_id
      t.string :win8_id

      t.timestamps
    end
  end
end
