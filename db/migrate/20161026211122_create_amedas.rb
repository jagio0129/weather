class CreateAmedas < ActiveRecord::Migration
  def change
    create_table :amedas do |t|
      t.string :prefecture
      t.integer :amedas_id
      t.string :category
      t.string :amedas_name
      t.string :phonetic
      t.text :address
      t.integer :latitude_degrees
      t.float :latitude_minutes
      t.integer :longitude_degrees
      t.float :longitude_minutes
      t.integer :above_sea_level
      t.float :height_of_the_anemometer
      t.float :height_of_the_thermometer
      t.string :observation_start_date

      t.timestamps null: false
    end
  end
end
