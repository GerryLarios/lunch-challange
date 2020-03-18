class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    redirect_to(meals_path) if session[:user_id]
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      login(user.id)
    else
      flash.now[:error] = 'Invalid email or password'
      render(:new) 
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to(root_path)
  end

  private
  
  def login(id)
    session[:user_id] = id
    redirect_to(meals_path)
  end

end
