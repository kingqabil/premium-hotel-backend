require 'swagger_helper'

RSpec.describe 'devise/registrations', type: :request do
      before :each do
      @user = create(:user)
      post '/api/v1/users/signup', params: {
        user: {
          name: 'ben',
          email: 'den@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }, as: :json
    end

        it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end

end
