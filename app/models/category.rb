class Category < ApplicationRecord

  has_many :menu_categories
  has_many :menus, :through => :menu_categories
  has_many :category_items
  has_many :items, :through => :category_items

 def items_attributes=(item_attributes)
   item_attributes.values.each do |item_attribute|
     if item_attribute[:name].present?
       item = Item.find_or_create_by(item_attribute)
       if !self.items.include?(item)
         self.category_items.build(:item => item)
       end
     end
   end
 end


end
