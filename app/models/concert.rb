class Concert < ActiveRecord::Base
  validates :name, :lat, :long, :description, :address, :phone, presence: true
end
