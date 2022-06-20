require 'json'

module ApiHelpers
  def json
    JSON.parse(response.body)
  end
end


module RequestSpecHelper

  def auth_headers(user)
    token = Knock::AuthToken.new(payload: {sub: user.id}).token
    {
        'Authorization': "Bearer #{token}"
    }
  end
end