require "#{Rails.root}/app/models/amedas_datum"
require "#{Rails.root}/app/models/snow_amedas_datum"
require 'kisho_cho_scraiping'
require 'csv'
require 'hpricot'
require 'open-uri'

class Tasks::RunnerTest
  #   amedas_datum {:prefecture :amedas_id :category :amedas_name :phonetic :address :latitude_degrees :latitude_minutes :longitude_degrees :longitude_minutes :above_sea_level :height_of_the_anemometer :height_of_the_thermometer :observation_start_date

  # snow_amedas_datum {:prefecture :amedas_id :category :amedas_name :phonetic :address :latitude_degrees :latitude_minutes :longitude_degrees :longitude_minutes :above_sea_level :observation_start_date

  def self.execute
    amedas_data = AmedasDatum.all
    snow_amedas_data = SnowAmedasDatum.all
    kisho_cho = KishoChoScraiping.new

    amedas_data.each do |data|
      kisho_cho.exec_scraping data if data[:category] == '四'
    end
  end
end
