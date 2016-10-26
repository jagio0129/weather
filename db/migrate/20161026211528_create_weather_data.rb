class CreateWeatherData < ActiveRecord::Migration
  def change
    create_table :weather_data do |t|
      t.integer :time
      t.float :temperature
      t.float :precipitation
      t.string :wind_direction
      t.float :wind_speed
      t.float :sunshine
      t.integer :depth_of_snow

      t.timestamps null: false
    end
  end
end
