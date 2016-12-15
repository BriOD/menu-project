class Category < ApplicationRecord
  belongs_to :menu
  has_many :category_items
  has_many :items, :through => :category_items

end
