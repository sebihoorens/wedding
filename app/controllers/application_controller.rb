# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_browser
  around_action :switch_locale

  protect_from_forgery with: :exception

  if ENV['BASIC_AUTH_NAME'] && ENV['BASIC_AUTH_PASSWORD']
    http_basic_authenticate_with \
      name: ENV['BASIC_AUTH_NAME'],
      password: ENV['BASIC_AUTH_PASSWORD']
  end

  def set_browser
    require "browser/aliases"
    Browser::Base.include(Browser::Aliases)
    @browser = Browser.new(request.env['HTTP_USER_AGENT'])
  end

  def switch_locale(&action)
    locale = params[:locale] || browser_locale || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def browser_locale
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return if !accept_language

    accept_language[/en|es|nl|fr/]
  end

  def default_url_options(_options = {})
    { locale: I18n.locale }
  end
end
