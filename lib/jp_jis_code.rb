require "jp_jis_code/base"
require "jp_jis_code/version"
require "jp_jis_code/code"
require "jp_jis_code/config"

module JpJisCode
  @config = Config.new

  def self.included(model_class)
    model_class.extend Base
  end

  def self.setup
    yield @config
  end

  def self.config
    @config
  end
end