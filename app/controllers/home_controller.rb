class HomeController < ApplicationController
  
  def index
    @user = User.find_by(id: current_user.id) if current_user
  end
end
