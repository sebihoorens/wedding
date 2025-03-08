class AddEmailUpdatesToGuests < ActiveRecord::Migration[6.0]
  def change
    change_table :guests do |t|
      t.boolean :email_updates, null: false, default: true
    end
  end
end
