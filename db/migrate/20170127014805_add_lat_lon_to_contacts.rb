class AddLatLonToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :my_contacts, :latitude, :float
    add_column :my_contacts, :longitude, :float
  end
end
