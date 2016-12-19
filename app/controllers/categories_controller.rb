class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
    @items = Item.all
    @category.items.build
    

  end

  def create
    raise params.inspect
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, item_ids: [], :items_attributes => [:name, :price, :description])
  end
end
