class Dance < ActiveRecord::Base
  validates :name, :lat, :long, :description, :open, :close, :address, :phone, presence: true
end
