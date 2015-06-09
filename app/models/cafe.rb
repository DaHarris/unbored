class Cafe < ActiveRecord::Base
  validates :name, :lat, :long, :description, presence: true
end
