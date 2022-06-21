require 'swagger_helper'
RSpec.describe 'api/v1/rooms', type: :request do
  # rubocop: disable Metrics
  before :all do
    @user = create(:user)
    post '/api/v1/users/signup', params: {
      user: {
        name: @user.name,
        email: 'backend@app.com',
        password: @user.password,
        password_confirmation: @user.password
      }
    }, as: :json

    post '/api/v1/users/login', params: {
      user: {
        email: 'backend@app.com',
        password: @user.password
      }
    }, as: :json

    @token = json['token']
  end
  before :each do
    @room = create(:room, user: @user)
  end
  path '/api/v1/rooms' do
    get('list rooms') do
      tags 'Rooms'
      security [bearer_auth: []]

      response(200, 'successful') do
        let(:Authorization) { json['token'] }
        run_test!
      end

      response('401', 'authentication failed') do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end

      response(200, 'Return all the available rooms') do
        it 'Return 3 contacts' do
          body = JSON(response.body)
          expect(body.count).to eq(1)
        end
      end
    end

    post('create room') do
      tags 'Rooms'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          city: { type: :string },
          rate: { type: :integer },
          room_type: { type: :string },
          amenities: { type: :string },
          picture: { type: :string }
        },
        required: %w[name city rate room_type amenities picture]
      }

      response '201', 'room created' do
        let(:Authorization) { @token }
        let(:room) do
          {
            name: @room.name,
            city: @room.city,
            rate: @room.rate,
            room_type: @room.room_type,
            amenities: @room.amenities,
            picture: @room.picture
          }
        end
        run_test!
      end

      response '201', 'successfully authenticated' do
        let(:Authorization) { @token }
        let(:room) do
          {
            name: @room.name,
            city: @room.city,
            rate: @room.rate,
            room_type: @room.room_type,
            amenities: @room.amenities,
            picture: @room.picture
          }
        end
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        let(:room) do
          {
            name: @room.name,
            city: @room.city,
            rate: @room.rate,
            room_type: @room.room_type,
            amenities: @room.amenities,
            picture: @room.picture
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show room') do
      tags 'Rooms'
      security [bearer_auth: []]

      response(204, 'Not Found') do
        let(:Authorization) { @token }
        let(:id) { @room.id }

        run_test!
      end
    end

    delete('delete room') do
      tags 'Rooms'
      security [bearer_auth: []]
      response(200, 'successful') do
        let(:Authorization) { @token }
        let(:id) { @room.id }
        run_test!
      end
    end
  end

  # rubocop: enable Metrics
end