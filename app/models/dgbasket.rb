class Dgbasket < ActiveRecord::Base
  validates :name, :lat, :long, :description, :holes, presence: true
end
