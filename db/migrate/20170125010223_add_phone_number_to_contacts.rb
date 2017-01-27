class AddPhoneNumberToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :my_contacts, :phone_number, :string
  end
end
