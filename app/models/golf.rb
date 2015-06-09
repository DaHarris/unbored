class Golf < ActiveRecord::Base
  validates :golf, :lat, :long, :description, :holes, :price, :phone, :address, :open, :close, presence: true
end
