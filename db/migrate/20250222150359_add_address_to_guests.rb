class AddAddressToGuests < ActiveRecord::Migration[6.0]
  def change
    change_table :guests do |t|
      t.string :address_street
      t.string :address_number
      t.string :address_city
      t.string :address_zip
      t.string :address_province
      t.string :address_country
    end
  end
end
