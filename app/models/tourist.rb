class Tourist < ActiveRecord::Base
  validates :name, :lat, :long, :description, :address, :phone, :open, :close, :price, presence: true
end
