class CreateSnowAmedasData < ActiveRecord::Migration
  def change
    create_table :snow_amedas_data do |t|
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
      t.string :observation_start_date

      t.timestamps null: false
    end
  end
end
