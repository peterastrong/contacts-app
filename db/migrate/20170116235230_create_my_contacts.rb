class CreateMyContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :my_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :home_address
      t.string :fun_person
      t.string :boolean

      t.timestamps
    end
  end
end
