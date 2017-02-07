class MyContact < ApplicationRecord
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  def time_of_change
    updated_at.strftime("%A, %b %d")
  end 

  def full_name
    "#{first_name} #{middle_name} #{last_name}" 
  end

  def japan_number
    "+81-#{phone_number}"
  end

  def self.all_johns
    where(first_name: "John")
    
  end 

  def address
    geo_localization = "#{latitude},#{longitude}"
    query = Geocoder.search(geo_localization).first
    query.address 
  end

end
