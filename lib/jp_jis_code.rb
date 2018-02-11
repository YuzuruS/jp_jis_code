require "jp_jis_code/version"
require "jp_jis_code/code"
require "jp_jis_code/config"

module JpJisCode
  @config = Config.new

  def self.config
    @config
  end
end