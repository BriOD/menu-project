class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:create, :update, :destroy]



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
      flash[:notice] = "Category succesfully created!"
      redirect_to category_path(@category)
    else
      flash[:error] = "Invalid category, please try again"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category succesfully updated!"
      redirect_to @category
    else
      flash[:error] = "Invalid edit, plase try again"
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Item deleted"
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
