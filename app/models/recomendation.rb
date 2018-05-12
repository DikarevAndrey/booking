class Recomendation < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :kind
  belongs_to :cuisine
end
