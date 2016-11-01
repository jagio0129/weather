class KishoChoScraiping
  BATCH_FILE_PATH = 'lib/tasks'.freeze
  KISHO_CHO_BASE_URL = 'http://www.jma.go.jp/jp/amedas_h/today-'.freeze

  def exec_scraping(data)
    # sleep 1
    url = "#{KISHO_CHO_BASE_URL}#{data[:amedas_id]}.html"
    puts url
    html = Hpricot(open(url))
    array = []
    html.search('#tbl_list tr').map do |tr|
      arr = [] # データ用配列 ( 1時間分 )
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
    col_rain = array[0].index("降水量")
    col_wind_dir = array[0].index("風向")
    col_wind_speed = array[0].index("風速")

    row_cnt = 0
    array.each do |row|
      # 1,2行目はヘッダ部分なので読み飛ばす
      if row_cnt > 1
        # 気温データが数値でなければ、ループ終了
        if /^[+-]?\d+\.?\d*$/ =~ row[col_temp].to_s
          @now_hour = row_cnt - 1
          puts "#{@now_hour}時：#{row[col_temp]}"
          puts "湿度：#{row[col_humi]}" unless col_humi.blank?
          puts "気圧：#{row[col_pres]}" unless col_pres.blank?
          puts "日照時間：#{row[col_sun]}" unless col_sun.blank?
          puts "降水雨量：#{row[col_rain]}" unless col_rain.blank?
          puts "風向き：#{row[col_wind_dir]}" unless col_wind_dir.blank?
          puts "風速：#{row[col_wind_speed]}" unless col_wind_speed.blank?
        else
          break
        end
      end
      row_cnt += 1
    end
  end
end
