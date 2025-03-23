class AddHouseholdRoleToPlusOnes < ActiveRecord::Migration[6.0]
  def change
    change_table :plus_ones do |t|
      t.string :household_role, null: false, default: 'child_12_or_under'
    end
    update_view :attendees, version: 2, revert_to_version: 1
    remove_column :plus_ones, :child
  end
end
