require 'open-uri'
require 'pdf-reader'
require 'jp_prefecture'
require "nkf"
require 'yaml'

#総務省のpdfをパースする
url = 'http://www.soumu.go.jp/main_content/000442938.pdf'

io = open(url)
reader = PDF::Reader.new(io)

yml = Hash.new { |h,k| h[k] = {} }
reader.pages.each do |page|
  page.text.split("\n").each do |raw_line|
    line = raw_line.split("\s")
    # 1列目が市区町村コードではなかった場合
    next if line[0].to_i.zero?

    # 政令指定都市か都道府県のみか
    if line.length == 3
      pref = JpPrefecture::Prefecture.find code: line[0].slice(0,2)
      # 都道府県のみの場合
      if pref.name == line[1]
        yml[line[0]] = {
          code: line[0],
          prefecture_name: pref.name,
          city_name: '',
          prefecture_name_h: pref.name_h,
          city_name_h: ''
        }
      # 政令指定都市の場合
      else
        yml[line[0]] = {
          code: line[0],
          prefecture_name: pref.name,
          city_name: line[1],
          prefecture_name_h: pref.name_h,
          city_name_h: NKF.nkf("--hiragana -w", line[2])
        }
      end
    elsif line.length == 5
      yml[line[0]] = {
        code: line[0],
        prefecture_name: line[1],
        city_name: line[2],
        prefecture_name_h: NKF.nkf("--hiragana -w", line[3]),
        city_name_h: NKF.nkf("--hiragana -w", line[4])
      }
    end
  end
end

open('jis_code.yml', 'w') do |f|
  f.write(YAML.dump(yml))
end