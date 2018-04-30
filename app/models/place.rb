class Place < ApplicationRecord
  has_and_belongs_to_many :cuisines
  has_one :feature, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :rating
  accepts_nested_attributes_for(:location, :feature, allow_destroy: true)
  has_many :offers
  has_many :recomendations
  has_many :reviews
end
