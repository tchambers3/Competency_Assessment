class SessionsController < ApplicationController
  def new
  end

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

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
