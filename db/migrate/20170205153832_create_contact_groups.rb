class CreateContactGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_groups do |t|
      t.integer :my_contact_id
      t.integer :group_id

      t.timestamps
    end
  end
end
