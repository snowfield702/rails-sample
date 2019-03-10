# frozen_string_literal: true

class CustomAuthBasicMiddelware < Rack::Auth::Basic
  def call(env)
    request = Rack::Request.new(env)
    if /.ngrok.io\z/.match?(request.host)
      super
    else
      @app.call(env)
    end
  end
end

Rails.application.configure do
  config.middleware.use CustomAuthBasicMiddelware do |username, password|
    username == ENV['NGROK_BASIC_USER'] && password == ENV['NGROK_BASIC_PASS']
  end
end
