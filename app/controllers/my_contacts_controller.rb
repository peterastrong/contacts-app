class MyContactsController < ApplicationController

  def index
    @contacts = MyContact.all.sort
    render "index.html.erb"
  end 

  def new
    render "new.html.erb"
  end 

  def create
    @contact = MyContact.new(first_name: params[:first_name])
    @contact.save
    render "create.html.erb"
  end

  def show
    @contact = MyContact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = MyContact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @contact = MyContact.find_by(id: params[:id])
    @contact.assign_attributes(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    @contact.save
    render "update.html.erb"
  end

  def destroy
    @contact = MyContact.find_by(id: params[:id])
    @contact.destroy
    render "destroy.html.erb"
  end

  

  def new_contact_result_method
    @contact = MyContact.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], home_address: params[:addres])
    @contact.save
    render "new_contact_result_view.html.erb"
  end
end
