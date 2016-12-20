class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @items = Item.all
    # @category.items.build
  end

  def create
    # raise params.inspect
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :item_ids => [], :items_attributes => [:name, :price, :description])
  end

  def set_category
    @category = Category.find_by_id(params[:id])
  end
end
