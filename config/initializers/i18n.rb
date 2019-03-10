# frozen_string_literal: true

Rails.application.configure do
  # 日本語のみ有効
  config.i18n.available_locales = %i[ja]
  config.i18n.default_locale = :ja
end
