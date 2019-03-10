# frozen_string_literal: true

Rails.application.routes.default_url_options[:host] = ENV.fetch('SITE_HOST')

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :fizz_buzzs, only: %i[show create]
end
