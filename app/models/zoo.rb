class Zoo < ActiveRecord::Base
  validates :name, :lat, :long, :description, :address, :phone, :open, :close, presence: true
end
