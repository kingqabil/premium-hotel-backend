require 'swagger_helper'
require 'json'

RSpec.describe 'devise/sessions', type: :request do
      before :each do
      @user = create(:user)
        post '/api/v1/users/signup', params: {
        user: {
          name: @user.name,
          email: 'ibertrand@example.com',
          password: @user.password,
          password_confirmation: @user.password
        }
      }, as: :json

      post '/api/v1/users/login', params: {
        user: {
          email: 'ibertrand@example.com',
          password: @user.password
        }
      }, as: :json
    end

        it 'returns a created status' do
        expect(response).to have_http_status(:ok)
      end
        it 'returns a token' do
        expect (json['token'])
      end

end
