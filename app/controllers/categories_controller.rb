class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit]


  def index
    @categories = Category.all
  end

  def show
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

  def edit
    @category.items.build

  end

  def update
    @category.update(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:name, item_ids: [], :items_attributes => [:name, :price, :description])
  end

  def set_category
    @category = Category.find_by_id(params[:id])
  end
end
