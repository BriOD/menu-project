class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:create, :update, :destroy]


  def index
    @items = Item.all
  end

  def show
    @review = @item.reviews.build
  end

  def new
    @item = Item.new
  end

  def create
    # raise params.inspect
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item succesfully created!"
      redirect_to item_path(@item)
    else
      flash[:error] = "Item Invalid, please try again"
      render 'new'
    end
  end

  def edit
  end

  def update
    # raise params.inspect
    if @item.update(item_params)
      flash[:notice] = "Item succesfully updated!"
      redirect_to @item
    else
      flash[:error] = "Invalid error, please try again"
      render :edit
    end
  end


  def destroy
    @item.destroy
    flash[:notice] = "Item destroyed"
    redirect_to items_path
  end





  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end

  def set_item
    @item = Item.find_by_id(params[:id])
  end


end
