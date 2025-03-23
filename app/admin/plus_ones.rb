# frozen_string_literal: true

ActiveAdmin.register PlusOne do
  permit_params :first_name, :last_name, :diet, :household_role

  form do |_f|
    inputs 'Plus One' do
      input :first_name
      input :last_name
      input :diet, as: :text
      input :household_role
    end
    actions
  end
end
