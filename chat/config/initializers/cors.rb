# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # file://, http://localhost:*, etc.
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
