<!-- Next thing i want to do: -->
  <!-- -create nested attributes for creating new items when creating a new category -->

  Where I left off:
    <!-- -when updating a category page won't redirect to room. it will just stall out. category will get updated though. -->
    <!-- -problem seems to be originating from #item_attributes method in category controller. -->
    <!-- -somehow a blank item is being generated when editing a category, and you leave the "create a new item" fields blank -->
    <!-- -now with validations of a item must have a name, we run into an error -->
        <!-- -What I had: -->
        <!-- def items_attributes=(item_attributes)
          item_attributes.values.each do |item_attribute|
            item = Item.find_or_create_by(item_attribute)
            self.items << item THIS WILL RETURN ALL ITEMS
          end
        end -->
        <!-- -Updated to: -->
        <!-- def items_attributes=(item_attributes)
          item_attributes.values.each do |item_attribute|
            if item_attribute[:name].present?
              item = Item.find_or_create_by(item_attribute)
              if !self.items.include?(item)
                self.category_items.build(:item => item)
              end
            end
          end
        end -->
        <!-- -also took out the @category.items.build in the controller, and replaced it with Item.new in the form -->
        <!-- -to create or edit a category. This resolves the issue for now, but only limited to making 1 new item -->
        <!-- -associated with the category. -->
          <!-- -also mental note about fixing this. i feel like a real dev identifying a problem, and doing research to fix it -->

    Up next:
      <!-- -create destroy actions for menu, category, and item. and display that in show pages. -->
      <!-- -left off: figuring out the correct path for a destroy action in category index page -->
      <!-- -create rating model -->
      <!-- -create user model, devise -->
      <!-- -users will be able to rate items. ratings table will need user_id, item_id, and a rating -->
        <!-- -create roles with devise, guest, normal, admin -->
    <!-- Left off: -->
      <!-- -Created roles for user. -->
      <!-- -want to create Review model, and come back to straightening out proper roles and authorization -->
      <!-- -sort out how a user can make a comment and/or rating on an item  -->
      <!-- -specify roles and what actions a guest, a user and an admin can do, and implement that in the controller and views -->
    Up next:
      -I think i want categories to be a nested resource of menu. on the menu show page you will be able to make a category/section, if you are am admin, otherwise it will just display menus.
      <!-- -I want to limit a user to 1 review per item. A user can edit their own review, but they can't make a 2nd review on a item they already reviewed. -->
        <!-- -solved this problem, but did so by putting the logic in the controller, don't really like that solution -->
      -be able to create a new category from individual menu show page, if you're an admin
      <!-- -be able to edit ones review -->
      <!-- -refactor authorization, can make a before action: require admin, something like that -->
    <!-- Left off: -->
        <!-- -Need to fix views/reviews.edit, need to figure out correct path to set. -->
      <!-- -Refactor and clean up item show page. the form_for review should just be a partial, as well as displaying the comments and ratings. -->
      <!-- -create a #most_popular_items method to display the highest rated items. -->
      <!-- -maybe a tp rated items: Item.where("average_rating > 4") or Item.where(:average_rating => 4..5) -->
      <!-- -Item.where(:created_at => 1.month.ago..DateTime.now) -- newest items on the menu -->
      <!-- -I wonder how to give an option of allergens or dislikes, and then supply a list of items that don't include that: Item.where.not("user_input") -->

      <!-- -Create view helper methods to assist with if current_user && current_user.admin? -->

      -have option to add this category to an existing menu


    -In order to solve problem of redirecting to a correct page, maybe a category should be a nested resource of a menu. then when you edit a category you redirect to the menu from params, and the category from params.

    -Let user be able to see all the reviews that they have made.
    <!-- -It seems I am not allowed to review an item twice, any review on any item restricts me from reviewing a different Item.  -- was checking to see if current_user was in collection of users who have reviewed after i built a review associated to the currect_user -->
