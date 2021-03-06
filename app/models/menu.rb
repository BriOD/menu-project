class Menu < ApplicationRecord
  has_many :menu_categories
  has_many :categories, :through => :menu_categories

  validates :name, presence: true

end
