Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://illustrious-manatee-a1d62c.netlify.app'
    resource '*', headers: :any, expose: ["Authorization"], methods: :any, max_age: 600
  end
end