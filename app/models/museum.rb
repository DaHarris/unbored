class Museum < ActiveRecord::Base
  validates :name, :lat, :long, :description, :address, :open, :close, :phone, presence: true
end
