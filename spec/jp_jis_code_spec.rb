require 'spec_helper'

RSpec.describe JpJisCode::Code do
  describe '.find' do
    describe '検索結果について' do
      describe "市区町村が見つかる 6桁" do
        let(:jis_code) { JpJisCode::Code.find('011002') }
        it { expect(jis_code.prefecture_name).to eq '北海道' }
        it { expect(jis_code.prefecture_name_k).to eq 'ﾎｯｶｲﾄﾞｳ' }
        it { expect(jis_code.city_name).to eq '札幌市' }
        it { expect(jis_code.city_name_k).to eq 'ｻｯﾎﾟﾛｼ' }
      end

      describe "市区町村が見つかる 5桁" do
        let(:jis_code) { JpJisCode::Code.find('01100') }
        it { expect(jis_code.prefecture_name).to eq '北海道' }
        it { expect(jis_code.prefecture_name_k).to eq 'ﾎｯｶｲﾄﾞｳ' }
        it { expect(jis_code.city_name).to eq '札幌市' }
        it { expect(jis_code.city_name_k).to eq 'ｻｯﾎﾟﾛｼ' }
      end

      describe '市区町村が見つからない' do
        let(:jis_code) { JpJisCode::Code.find('000000') }
        it { expect(jis_code).to be_nil }
      end
    end
  end
end