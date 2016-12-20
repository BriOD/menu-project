Next thing i want to do:
  -create nested attributes for creating new items when creating a new category

  Where I left off:
    -when updating a category page won't redirect to room. it will just stall out. category will get updated though.
    -problem seems to be originating from #item_attributes method in category controller.
    -somehow a blank item is being generated when editing a category, and you leave the "create a new item" fields blank
    -now with validations of a item must have a name, we run into an error
        -What I had:
        <!-- def items_attributes=(item_attributes)
          item_attributes.values.each do |item_attribute|
            item = Item.find_or_create_by(item_attribute)
            self.items << item THIS WILL RETURN ALL ITEMS 
          end
        end -->
