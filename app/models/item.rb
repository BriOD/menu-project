class Item < ApplicationRecord
  has_many :reviews
  has_many :category_items
  has_many :categories, :through => :category_items
  validates :name, presence: true
  validates :price, presence: true
  # validate :already_reviewed?

  #if a user has alreadt posted a review on an item, they are not allowed to post a 2nd review, they can only
  #edit thier existing review.

  def users_who_reviewed
    #we call this on an instance on an item to collect all the user who have reviewed this item.
   self.reviews.collect do |review|
      review.user
    end
  end

  def avg_rating
    ratings = self.reviews.collect {|review| review.rating}
    ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
    # binding.pry
  end

  def self.most_popular
    where(:average_rating => 4..5)
  end

  # def already_reviewed?
  #   if users_who_reviewed.include?(current_user)
  #     false
  #   end
  # end

end
