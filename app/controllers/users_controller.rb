class UsersController < ApplicationController
  # the 'index' view will give us the login form
  def index
  end

  # the 'new' view will give us the sign up form
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
    end
end
