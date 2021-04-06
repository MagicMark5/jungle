class SessionsController < ApplicationController
  def new
  end

  # Log user in
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # The authenticate logic is now in authenticate_with_credentials in the User model

      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  # Log user out
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
