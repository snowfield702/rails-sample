# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/fizz_buzzs', type: :request do
  describe 'GET /fizz_bazzs/:id' do
    subject { get fizz_buzz_path(id) }

    let!(:fizz_buzz) { FactoryBot.create(:fizz_buzz, number: 15) }
    let(:id) { fizz_buzz.id }

    it 'HTTPステータスコードの200が返却される' do
      subject
      expect(response).to have_http_status(200)
    end

    it 'numberやtextなどの値がjson形式で返却される' do
      subject
      expect(response.body).to be_json_including(id: fizz_buzz.id, number: fizz_buzz.number, text: fizz_buzz.text)
    end

    context '存在しないIDを指定した場合' do
      let(:id) { 0 }

      it 'HTTPステータスコードの404が返却される' do
        subject
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /fizz_bazzs' do
    subject { post fizz_buzzs_path(number: 15) }

    it 'HTTPステータスコードの200が返却される' do
      subject
      expect(response).to have_http_status(200)
    end

    it 'numberやtextなどの値がjson形式で返却される' do
      subject
      expect(response.body).to be_json_including(id: Integer, number: 15, text: 'FizzBuzz')
    end

    it '新規レコードが登録される' do
      expect { subject }.to change(FizzBuzz, :count).by(1)
    end
  end
end
