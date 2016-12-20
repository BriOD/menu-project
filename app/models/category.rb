class Category < ApplicationRecord

  has_many :menu_categories
  has_many :menus, :through => :menu_categories
  has_many :category_items
  has_many :items, :through => :category_items

  # accepts_nested_attributes_for :items
 #
 #  def categories_attributes=(category_attributes)
 #     category_attributes.values.each do |category_attribute|
 #       category = Category.find_or_create_by(category_attribute)
 #       self.categories << category
 #     end
 #   end
 # end

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


    #  "category"=>{"name"=>"new category w a new item", "item_ids"=>["", "3"],
    #    "item"=>{"name"=>"new item", "price"=>"4.50", "description"=>"this is a new item"}},
    #    "commit"=>"Create Category", "controller"=>"categories", "action"=>"create"} permitted: false>
  #
  # def item_attributes=(items_hash)
  #   # binding.pry
  #   items_hash.each do |i, item_attributes|
  #     self.items.build(item_attributes)
  #   end
  #
  # end

end
