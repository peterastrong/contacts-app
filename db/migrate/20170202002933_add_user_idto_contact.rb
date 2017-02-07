class AddUserIdtoContact < ActiveRecord::Migration[5.0]
  def change
    add_column :my_contacts, :user_id, :integer
  end
end
