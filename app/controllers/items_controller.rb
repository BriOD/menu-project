class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    if current_user.admin?
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "Item succesfully created!"
        redirect_to item_path(@item)
      else
        flash[:error] = "Item Invalid, please try again"
        render 'new'
      end
    else
      flash[:error] = "You are not authorized to create an item"
      redirect_to :root
    end
  end

  def edit
  end

  def update
    # raise params.inspect
    if current_user.admin?
      if @item.update(item_params)
        flash[:notice] = "Item succesfully updated!"
        redirect_to @item
      else
        flash[:error] = "Invalid error, please try again"
        render :edit
      end
    else
      flash[:error] = "You are not authorized to edit an item"
      redirect_to :root
    end
  end


  def destroy
    if current_user.admin?
      @item.destroy
      flash[:notice] = "Item destroyed"
      redirect_to items_path
    else
      flash[:error] = "You are not authorized to delete an item"
      redirect_to :root
    end
  end





  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end

  def set_item
    @item = Item.find_by_id(params[:id])
  end


end
