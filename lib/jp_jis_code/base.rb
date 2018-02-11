module JpJisCode
  module Base
    def jp_jis_code(column_name, options = {})
      column_name = column_name.to_sym if column_name.is_a?(String)
      method_name = options[:method_name] || :jis_code

      define_method method_name do
        JpJisCode::Code.find(self.send(column_name))
      end
    end
  end
end