Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://illustrious-manatee-a1d62c.netlify.app','http://localhost:3000', ' http://localhost:3000', 'http://192.168.123.238:3000' 'http://127.0.0.1:3000'
    resource '*', headers: :any, expose: ["Authorization"], methods: :any, max_age: 600
  end
end