class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    # raise params.inspect
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # raise params.inspect
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end


  def destroy
    @item.destroy
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
