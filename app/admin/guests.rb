# frozen_string_literal: true

ActiveAdmin.register Guest do
  permit_params :email, :first_name, :last_name, :address_street, :address_number,
                :address_city, :address_zip, :address_province, :address_country,
                :attending, :diet, :songs, :notes

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :address
    column :attending
    column :diet
    column :songs
    column :notes
    column :created_at
    column :updated_at
    column :token
    column :confirmed_at
    actions
  end

  scope :confirmed
  scope :attending
  scope :not_attending

  form do |_f|
    inputs 'Guest' do
      input :email, as: :string
      input :first_name
      input :last_name
      input :address_street
      input :address_number
      input :address_city
      input :address_zip
      input :address_province
      input :address_country
      input :attending
      input :diet, as: :text
      input :songs, as: :text
      input :notes, as: :text
    end
    actions
  end
end
