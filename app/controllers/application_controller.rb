class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def must_be_admin
    if !current_user.admin?
      flash[:error] = "You are not authorized for this action"
      redirect_to :root
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:name, :email)
    end
  end

end
