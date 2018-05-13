class Location < ApplicationRecord
  belongs_to :subway
  belongs_to :city
  accepts_nested_attributes_for(:subway, :city, allow_destroy: true)
  belongs_to :place
end
