class Place < ApplicationRecord
  has_and_belongs_to_many :cuisines
  has_one :feature
  has_one :location
  has_many :offers
  has_one :rating
  has_many :recomendations
  has_many :reviews
end
