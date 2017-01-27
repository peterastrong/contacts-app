class MyContact < ApplicationRecord
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

end
