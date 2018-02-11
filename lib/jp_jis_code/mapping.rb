require 'yaml'

module JpJisCode
  module Mapping

    filepath = File.join(File.dirname(__FILE__), '../../data/jis_code.yml')
    @data = YAML.load_file(filepath)

    def self.data
      JpJisCode.config.mapping_data || @data
    end
  end
end