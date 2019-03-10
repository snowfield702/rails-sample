# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = 'https://c41545140c0a40c180369284ee5bc5b7:eebc867f9ea642c5a5ec1f437c065c27@sentry.io/1411852'

  config.environments = %w[production]

  config.tags = { project: Rails.application.class.parent_name.underscore }

  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
