class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
    # raise params.inspect
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Menu succesfully created!"
      redirect_to menu_path(@menu)
    else
      flash[:error] = "Invalid Menu, please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit
    end
  end


  def destroy
    @menu.destroy
    redirect_to menus_path
  end

  private

  def set_menu
    @menu = Menu.find_by_id(params[:id])
  end


  def menu_params
    params.require(:menu).permit(:name, category_ids: [])
  end
end
