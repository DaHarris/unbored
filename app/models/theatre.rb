class Theatre < ActiveRecord::Base
  validates :name, :lat, :long, :description, :address, :phone, :icon, presence: true
end
