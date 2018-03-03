# JpJisCode

[![Gem Version](https://badge.fury.io/rb/jp_jis_code.svg)](https://badge.fury.io/rb/jp_jis_code)
[![Build Status](https://travis-ci.org/YuzuruS/jp_jis_code.svg?branch=master)](https://travis-ci.org/YuzuruS/jp_jis_code)
[![Maintainability](https://api.codeclimate.com/v1/badges/74f87eba9109855a15f1/maintainability)](https://codeclimate.com/github/YuzuruS/jp_jis_code/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/YuzuruS/jp_jis_code/badge.svg)](https://coveralls.io/github/YuzuruS/jp_jis_code)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/YuzuruS/jp_jis_code.svg)](https://beta.gemnasium.com/projects/github.com/YuzuruS/jp_jis_code)

全国地方公共団体コード(JIS地名コード)から都道府県、市区町村を変換するライブラリです。

参考: [全国地方公共団体コード](https://ja.wikipedia.org/wiki/全国地方公共団体コード)

## インストール方法

Gemfileに下記の行を追加してください。

```ruby
gem 'jp_jis_code'
```

それから下記を実行してください。

    $ bundle

もしくは下記のようなコマンドでもインストールできます。

    $ gem install jp_jis_code

## 使用方法

市区町村コードには5桁のものと6桁のものがありますが、
両方対応しています。

```ruby
code = JpJisCode::Code.find('011002')
code.prefecture_name
# => '北海道'
code.prefecture_name_h
# => 'ほっかいどう'
code.city_name
# => '札幌市'
code.city_name_h
# => 'さっぽろし'

code = JpJisCode::Code.find('01100')
code.prefecture_name
# => '北海道'
code.prefecture_name_h
# => 'ほっかいどう'
code.city_name
# => '札幌市'
code.city_name_h
# => 'さっぽろし'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/YuzuruS/jp_jis_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JpJisCode project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/YuzuruS/jp_jis_code/blob/master/CODE_OF_CONDUCT.md).
