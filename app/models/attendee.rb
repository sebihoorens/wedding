# frozen_string_literal: true

#
# A guest or plus one.
#
class Attendee < ApplicationRecord
  scope :diet?, -> { where.not(diet: nil) }
  scope :child_12_or_under?, -> { where(household_role: 'child_12_or_under') }
end
