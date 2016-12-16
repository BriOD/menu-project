class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by_id(params[:id])
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



  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end


end
