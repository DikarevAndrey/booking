class Place < ApplicationRecord
  belongs_to :cuisine
  has_one :feature, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :rating
  has_many :offers
  has_many :recomendations
  has_many :reviews
  belongs_to :kind
  accepts_nested_attributes_for(:location, :feature, :kind, :cuisine, allow_destroy: true)
end
