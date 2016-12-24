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
        redirect_to item_path(@item)
      else
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
        redirect_to @item
      else
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
