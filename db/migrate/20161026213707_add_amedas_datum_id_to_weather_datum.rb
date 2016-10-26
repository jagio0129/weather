class AddAmedasDatumIdToWeatherDatum < ActiveRecord::Migration
  def change
    add_column :weather_data, :amedas_datum_id, :integer
  end
end
