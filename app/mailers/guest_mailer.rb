# frozen_string_literal: true

class GuestMailer < ApplicationMailer
  default from: ENV['FROM_EMAIL'], reply_to: ENV['CONTACT_EMAIL']

  def confirmation_admin_email(guest)
    @guest = guest
    mail(
      to: 'sebihoorens@gmail.com',
      cc: ['jessi-leon@hotmail.com'], # TODO: Add wedding planner
      subject: "#{I18n.t(:wedding_name)}: #{I18n.t('email.rsvp_confirmation')}"
    )
  end

  def confirmation_guest_email(guest)
    @guest = guest
    mail(
      to: guest.name_with_email,
      subject: "#{I18n.t(:wedding_name)}: #{I18n.t('email.rsvp_confirmation')}"
    )
  end

  def welcome_back_email(guest)
    @guest = guest
    mail(
      to: 'sebihoorens@gmail.com', # to: guest.name_with_email,
      subject: "#{I18n.t(:wedding_name)}: #{I18n.t('email.your_rsvp')}"
    )
  end
end
