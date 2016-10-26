require 'csv'

csv_data = CSV.read('doc/amedas/ame_master_to_utf8.csv', headers: true)
csv_data.each do |data|
  puts data
  amedas = AmedasDatum.create!(prefecture: "#{data["都府県振興局"]}",
                  amedas_id: "#{data["観測所番号"]}",
                  category: "#{data["種類"]}",
                  amedas_name: "#{data["観測所名"]}",
                  phonetic: "#{data["ｶﾀｶﾅ名"]}",
                  address: "#{data["所在地"]}",
                  latitude_degrees: "#{data["緯度(度)"]}",
                  latitude_minutes: "#{data["緯度(分)"]}",
                  longitude_degrees: "#{data["経度(度)"]}",
                  longitude_minutes: "#{data["経度(分)"]}",
                  above_sea_level: "#{data["海面上の高さ(ｍ)"]}",
                  height_of_the_anemometer: "#{data["風速計の高さ(ｍ)"]}",
                  height_of_the_thermometer: "#{data["温度計の高さ(ｍ)"]}",
                  observation_start_date: "#{data["観測開始年月日"]}")
end

csv_data = CSV.read('doc/amedas/snow_master_to_utf8.csv', headers: true)
csv_data.each do |data|
  puts data
  amedas = SnowAmedasDatum.create!(prefecture: "#{data["都府県振興局"]}",
                  amedas_id: "#{data["観測所番号"]}",
                  category: "#{data["種類"]}",
                  amedas_name: "#{data["観測所名"]}",
                  phonetic: "#{data["ｶﾀｶﾅ名"]}",
                  address: "#{data["所在地"]}",
                  latitude_degrees: "#{data["緯度(度)"]}",
                  latitude_minutes: "#{data["緯度(分)"]}",
                  longitude_degrees: "#{data["経度(度)"]}",
                  longitude_minutes: "#{data["経度(分)"]}",
                  above_sea_level: "#{data["海面上の高さ(ｍ)"]}",
                  observation_start_date: "#{data["観測開始年月日"]}")
end
