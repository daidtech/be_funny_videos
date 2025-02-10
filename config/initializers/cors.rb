Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Replace '*' with specific domains in production; for testing, keep it as '*' for easier testing
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
