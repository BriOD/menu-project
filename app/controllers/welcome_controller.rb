class WelcomeController < ApplicationController
  def home
    @menus = Menu.all
  end
end
