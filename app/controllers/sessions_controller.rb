class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])

  #   # if the user exists AND password is correct
  #   if user && user.authenticate(params[:password])
  #     # save the user id inside browser cookie
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #     # if login doesn't work, redirect back to login
  #     redirect_to '/login'
  #   end
  # end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate_with_credentials(params[:password])
      # success, saves the user id inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if login doesn't work, redirect back to login
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
