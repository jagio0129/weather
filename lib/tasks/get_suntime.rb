require 'csv'
require 'kconv'
require 'hpricot'
require 'open-uri'

KISHO_CHO_URL = 'http://www.jma.go.jp/jp/amedas_h/today-'
"11016.html"

=begin
File.foreach("ame_master.csv") do |row|
  p row.toutf8
  File.open("ame_master_to_utf8.csv",'a').puts(row.toutf8) #->UTF-8な日本語
end
=end

def scraping amedas
  sleep 1
  url = "#{KISHO_CHO_URL}#{amedas[:id]}.html"
  puts url
  html = Hpricot( open( url ) )
  array = []
  html.search('#tbl_list tr').map do |tr|

    arr = []  # データ用配列 ( 1時間分 )
    # 1時間分のデータ読み込み
    tr.search('td').each do |td|
      arr << td.inner_html.strip
    end
    array << arr

  end

  # 何番目に「気温」、「湿度」、「気圧」のデータが格納されているかを検索
  # ( 列の構成が変更になっても対応可能 )
  col_temp = array[0].index("気温")
  col_humi = array[0].index("湿度")
  col_pres = array[0].index("気圧")
  col_sun = array[0].index("日照時間")

  row_cnt = 0
  array.each do |row|
    # 1,2行目はヘッダ部分なので読み飛ばす
    if row_cnt > 1
      # 気温データが数値でなければ、ループ終了
      if /^[+-]?\d+\.?\d*$/ =~ row[col_temp].to_s
        @now_hour = row_cnt - 1
        if /^[+-]?\d+\.?\d*$/ =~ row[col_sun].to_s
          @col_sun = row[col_sun].to_s
          puts "#{@now_hour}時：#{@col_sun}"
        end
      else
        break
      end
    end
    row_cnt += 1
  end
end

csv_data = CSV.read('ame_master_to_utf8.csv', headers: true)
csv_data.each do |data|
  amedas = {name: "#{data["観測所名"]}", id: "#{data["観測所番号"]}", category: "#{data["種類"]}"}
  if (amedas[:category] == '四')
    puts "スクレイピング：#{amedas[:name]},#{amedas[:category]}"
    scraping amedas
  end
end
