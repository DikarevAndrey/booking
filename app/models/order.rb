class Order < ApplicationRecord
  belongs_to :place
  belongs_to :user

  after_create :update_recomendation

  def update_recomendation
    puts 'fired'
    recomendation = Recomendation.where(:user_id => self.user_id).first_or_create
      recomendation.place_id = Order.where(:user_id => self.user_id).select(:place_id).group(:place_id).having("count(*) > 0").size.invert.max&.last.to_i
      puts recomendation.place_id

      h = {}
      Order.where(:user_id => self.user_id).includes(:place).each do |order|
        x = h.fetch(order.place.kind_id, 0) + 1
        h[order.place.kind_id] = x
      end
      recomendation.kind_id = h.max_by{|k,v| v}.first
      puts recomendation.kind_id

      h = {}
      Order.where(:user_id => self.user_id).includes(:place).each do |order|
        x = h.fetch(order.place.cuisine_id, 0) + 1
        h[order.place.cuisine_id] = x
      end
      recomendation.cuisine_id = h.max_by{|k,v| v}.first
      puts recomendation.cuisine_id
    recomendation.save()
  end
end
