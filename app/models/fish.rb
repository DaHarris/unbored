class Fish < ActiveRecord::Base
  validates :name, :lat, :long, :description, presence: true
end
