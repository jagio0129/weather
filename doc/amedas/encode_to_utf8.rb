require 'csv'
require 'kconv'

# 気象庁からdownloadい
File.foreach("snow_master.csv") do |row|
  p row.toutf8
  File.open("snow_master_to_utf8.csv",'a').puts(row.toutf8) #->UTF-8な日本語
end
