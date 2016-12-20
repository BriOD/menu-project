class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find_by_id(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    # raise params.inspect
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find_by_id(params[:id])
  end

  def update
    @menu = Menu.find_by_id(params[:id])
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, category_ids: [])
  end
end
