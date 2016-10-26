class AddSnowAmedasDatumIdToWeatherDatum < ActiveRecord::Migration
  def change
    add_column :weather_data, :snow_amedas_datum_id, :integer
  end
end
