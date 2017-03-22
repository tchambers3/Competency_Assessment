class SessionsController < ApplicationController
  def new
  end

  # POST /login
  def create
    user = User.find_by_username(params[:username]).first
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  # GET Logout
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
