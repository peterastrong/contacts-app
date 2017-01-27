class AddBioToMyContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :my_contacts, :bio, :text
  end
end
