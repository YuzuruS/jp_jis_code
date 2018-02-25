require "jp_jis_code/mapping"

module JpJisCode
  class Code
    attr_accessor :code, :prefecture_name, :city_name, :prefecture_name_k, :city_name_k

    def self.build(ret)
      city = self.new
      city.code              = ret[:code]
      city.prefecture_name   = ret[:prefecture_name]
      city.city_name         = ret[:city_name]
      city.prefecture_name_k = ret[:prefecture_name_k]
      city.city_name_k       = ret[:city_name_k]
      city
    end

    def self.find(code)
      n_code = normalized_code(code)
      return unless n_code
      ret = Mapping.data[n_code]
      return unless ret

      build(ret)
    end

    def self.normalized_code(code)
      return false if code.nil?
      return false unless code.is_a?(String)
      return check_digit(code) if code.to_s.length == 5
      return code if code.to_s.length == 6
      false
    end

    def self.check_digit(code)
      digit = code.to_s.chars.map(&:to_i)
      last_digit = (((digit[0] * 6 + digit[1] * 5 + digit[2] * 4 + digit[3] * 3 + digit[4] * 2) % 11)  - 11).abs % 10
      code.to_s + last_digit.to_s
    end
  end
end