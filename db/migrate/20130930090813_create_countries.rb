class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :itunes_country
      t.string :win8_country
      t.string :android_country

      t.timestamps
    end
  end
end
