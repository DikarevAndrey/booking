class Review < ApplicationRecord
  belongs_to :place
  belongs_to :user

  after_create :update_place_rating

  def update_place_rating
    puts 'fired'
    rating = Rating.find_by(:place_id => self.place_id)
    rating.points = Review.where(:place_id => self.place_id).average(:points).to_i
    rating.save()
  end
end
