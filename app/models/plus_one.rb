# frozen_string_literal: true

#
# An extra guest.
#
class PlusOne < ApplicationRecord
  HOUSEHOLD_ROLES = %w[child_12_or_under child_over_12 partner]
  belongs_to :guest

  auto_strip_attributes :first_name, :last_name, :diet

  validates :first_name, presence: true
  validates :first_name, length: { maximum: 1024 }
  validates :last_name, presence: true
  validates :last_name, length: { maximum: 1024 }

  validates :diet, length: { maximum: 8192 }
  validates :household_role, presence: true, inclusion: { in: HOUSEHOLD_ROLES }
  validate :max_one_partner

  def name
    "#{first_name} #{last_name}"
  end

  def child?
    household_role.in?(%w[child_12_or_under child_over_12])
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at diet first_name guest_id household_role id last_name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['guest']
  end

  private def max_one_partner
    if household_role == 'partner' && guest.plus_ones.where.not(id: id).exists?(household_role: 'partner')
      errors.add(:household_role, I18n.t('rsvp.polygamy'))
    end
  end
end
