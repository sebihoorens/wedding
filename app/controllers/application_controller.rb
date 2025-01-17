# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  protect_from_forgery with: :exception

  if ENV['BASIC_AUTH_NAME'] && ENV['BASIC_AUTH_PASSWORD']
    http_basic_authenticate_with \
      name: ENV['BASIC_AUTH_NAME'],
      password: ENV['BASIC_AUTH_PASSWORD']
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
