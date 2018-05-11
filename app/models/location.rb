class Location < ApplicationRecord
  belongs_to :city
  accepts_nested_attributes_for(:city, allow_destroy: true)
  belongs_to :place
end
