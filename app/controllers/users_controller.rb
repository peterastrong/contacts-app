class UsersController < ApplicationController

  def new
    render "new.html.erb"
  end 

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    user.save

    if user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully created user."
      redirect_to "/my_contacts"
      
    else 
      flash[:warning] = "Invalid email or password"
      redirect_to "/signup"
    end 
  end 
end
