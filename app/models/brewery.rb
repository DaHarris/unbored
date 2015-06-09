class Brewery < ActiveRecord::Base
  validates :name, :lat, :long, :open, :close, :phone, :address, :description, presence: true
end
