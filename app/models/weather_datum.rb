class WeatherDatum < ActiveRecord::Base
  belongs_to :amedas_datum
  belongs_to :snow_amedas_datum
end
