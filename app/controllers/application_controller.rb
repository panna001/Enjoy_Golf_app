class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def set_search
    @q = Post.ransack(params[:q])
    @search_posts = @q.result(distinct: true)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :sex, :email, :prefecture, :phone_number, :start_year, :start_month])
  end
end
