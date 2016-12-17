class Category < ApplicationRecord

  has_many :menu_categories
  has_many :menus, :through => :menu_categories
  has_many :category_items
  has_many :items, :through => :category_items

end
