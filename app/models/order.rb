class Order < ApplicationRecord
  belongs_to :place
  belongs_to :user
end
