class SessionsController < ApplicationController
  

  def new
    render "new.html.erb"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "You are logged in."
      redirect_to "/my_contacts"
    else 
      flash[:warning] = "Invalid password."
      redirect_to "/login"
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out."
    redirect_to "/my_contacts"
  end
end
