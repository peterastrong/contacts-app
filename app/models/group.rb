class Group < ApplicationRecord
  has_many :contact_groups
  has_many :my_contacts, through: :contact_groups
end
