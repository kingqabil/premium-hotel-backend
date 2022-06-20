require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  # rubocop: disable Metrics
 before :all do
          @user = create(:user)
    post '/api/v1/users/signup', params: {
    user: {
      name: @user.name,
      email: @user.email,
      password: @user.password,
      password_confirmation: @user.password
    }
  }, as: :json

  post '/api/v1/users/login', params: {
    user: {
      email: @user.email,
      password: @user.password
    }
  }, as: :json

  @token = json['token']
  end
  before :each do
    @room = create(:room, user: @user)
  end

  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [bearer_auth: []]

      response(200, 'successful') do
        let(:Authorization) {@token}
        it 'Return  response' do
          body = JSON(response.body)
          expect(body.count).to eq(0)
        end
        run_test!
      end

      response '200', 'ok'  do
        let(:Authorization) {@token}
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          check_in: { type: :date },
          check_out: { type: :date },
          room_id: { type: :integer }
        },
        required: %w[check_in check_out room_id]
      }

      response '201', 'reservation created' do
        let(:Authorization) {@token}
        let(:reservation) do
          { check_in: '2022-12-12', check_out: '2022-12-14', room_id: @room.id }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:Authorization) {@token}
        let(:reservation) { { check_in: '2022-01-26', check_out: '2022-01-29' } }
        run_test!
      end

      response '201', 'successfully authenticated' do
        let(:Authorization) { @token }
                let(:reservation) do
          { check_in: '2022-12-12', check_out: '2022-12-14', room_id: @room.id }
        end
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
                let(:reservation) do
          { check_in: '2022-12-12', check_out: '2022-12-14', room_id: @room.id }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    before :each do
        @reservation = create(:reservation, room: @room, user: @user)
    end
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      tags 'Reservations'
      security [bearer_auth: []]
      response(200, 'successful') do
        let(:Authorization) { @token}
        let(:id) { @reservation.id }
        run_test!
      end

      response '200', 'delete reservation' do
        let(:Authorization) { @token }
        let(:id) { @reservation.id }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        let(:id) { @reservation.id }
        run_test!
      end
    end
  end
  # rubocop: enable Metrics
end
