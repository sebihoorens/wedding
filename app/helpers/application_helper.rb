# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    case key
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert alert-error'
    end
  end

  def errors_for(object)
    return unless object.errors.any?

    content_tag(:div, class: 'mb-3 card border-danger') do
      concat(content_tag(:div, class: 'card-header bg-danger text-white') do
        concat "Oops, #{pluralize(object.errors.count, 'problem')}:"
      end)
      concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
        object.errors.full_messages.each do |msg|
          concat content_tag(:li, msg, class: 'list-group-item')
        end
      end)
    end
  end

  def navbar_active(controller_name)
    controller_name == params[:controller] ? 'active' : nil
  end

  def language_dropdown_active(locale)
    locale == I18n.locale ? 'active' : nil
  end

  def current_language
    case I18n.locale
    when :en
      'English'
    when :es
      'Español'
    when :nl
      'Nederlands'
    when :fr
      'Français'
    else
      I18n.locale.to_s
    end
  end
end
