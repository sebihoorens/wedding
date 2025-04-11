# frozen_string_literal: true

#
# ActiveAdmin console user.
#
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at current_sign_in_at current_sign_in_ip email encrypted_password id last_sign_in_at last_sign_in_ip remember_created_at reset_password_sent_at reset_password_token sign_in_count updated_at]
  end
end
