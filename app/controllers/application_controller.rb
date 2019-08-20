class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :get_name_params, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Post.includes(:photos, :user).order('created_at DESC').ransack(params[:q])
    @search_articles = @search.result
    # raise
  end

  protected

  def get_name_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
