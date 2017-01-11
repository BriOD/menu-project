class WelcomeController < ApplicationController
  def home
    @menus = Menu.all
    @popular_items = Item.most_popular
  end



end
