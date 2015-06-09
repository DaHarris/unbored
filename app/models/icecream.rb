class Icecream < ActiveRecord::Base
  validates :name, :lat, :long, :description, :open, :close, :phone, :address, presence: true
end
