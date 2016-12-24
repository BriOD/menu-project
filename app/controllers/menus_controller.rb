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
    if current_user.admin?
      @menu = Menu.new(menu_params)
      if @menu.save
        flash[:notice] = "Menu succesfully created!"
        redirect_to menu_path(@menu)
      else
        flash[:error] = "Invalid Menu, please try again."
        render 'new'
      end
    else
      flash[:error] = "You are not authorized to create a menu"
      redirect_to :root
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @menu.update(menu_params)
        flash[:notice] = "Menu succesfully updated!"
        redirect_to @menu
      else
        flash[:error] = "Invalid edit, please try again"
        render :edit
      end
    else
      flash[:error] = "You are not authorized to edit a menu"
      redirect_to :root
    end
  end


  def destroy
    if current_user.admin?
      @menu.destroy
      flash[:notice] = "Succesfully deleted the menu"
      redirect_to menus_path
    else
      flash[:error] = "You are not authorized to delete a menu"
      redirect_to :root
    end
  end

  private

  def set_menu
    @menu = Menu.find_by_id(params[:id])
  end


  def menu_params
    params.require(:menu).permit(:name, category_ids: [])
  end
end
