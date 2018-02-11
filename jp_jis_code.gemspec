# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jp_jis_code/version"

Gem::Specification.new do |spec|
  spec.name          = "jp_jis_code"
  spec.version       = JpJisCode::VERSION
  spec.authors       = ["Yuzuru Suzuki"]
  spec.email         = ["navitima@gmail.com"]

  spec.summary       = "全国地方公共団体コードから住所(都道府県、市区町村)を取得するgem"
  spec.description   = "全国地方公共団体コードから住所(都道府県、市区町村)を取得するgem"
  spec.homepage      = "https://github.com/YuzuruS/jp_jis_code"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "guard"
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'ffi', '1.9.18'
  spec.add_development_dependency 'activerecord', '>= 3.2.0'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'appraisal'
end
